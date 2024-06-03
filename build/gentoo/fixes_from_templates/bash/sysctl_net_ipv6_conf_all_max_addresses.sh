# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle,multi_platform_debian
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium

# Comment out any occurrences of net.ipv6.conf.all.max_addresses from /etc/sysctl.d/*.conf files

for f in /etc/sysctl.d/*.conf /run/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf; do


  # skip systemd-sysctl symlink (/etc/sysctl.d/99-sysctl.conf -> /etc/sysctl.conf)
  if [[ "$(readlink -f "$f")" == "/etc/sysctl.conf" ]]; then continue; fi

  matching_list=$(grep -P '^(?!#).*[\s]*net.ipv6.conf.all.max_addresses.*$' $f | uniq )
  if ! test -z "$matching_list"; then
    while IFS= read -r entry; do
      escaped_entry=$(sed -e 's|/|\\/|g' <<< "$entry")
      # comment out "net.ipv6.conf.all.max_addresses" matches to preserve user data
      sed -i --follow-symlinks "s/^${escaped_entry}$/# &/g" $f
    done <<< "$matching_list"
  fi
done

#
# Set sysctl config file which to save the desired value
#

SYSCONFIG_FILE="/etc/sysctl.conf"

sysctl_net_ipv6_conf_all_max_addresses_value='(bash-populate sysctl_net_ipv6_conf_all_max_addresses_value)'


#
# Set runtime for net.ipv6.conf.all.max_addresses
#
/sbin/sysctl -q -n -w net.ipv6.conf.all.max_addresses="$sysctl_net_ipv6_conf_all_max_addresses_value"

#
# If net.ipv6.conf.all.max_addresses present in /etc/sysctl.conf, change value to appropriate value
#	else, add "net.ipv6.conf.all.max_addresses = value" to /etc/sysctl.conf
#

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^net.ipv6.conf.all.max_addresses")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$sysctl_net_ipv6_conf_all_max_addresses_value"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^net.ipv6.conf.all.max_addresses\\>" "${SYSCONFIG_FILE}"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^net.ipv6.conf.all.max_addresses\\>.*/$escaped_formatted_output/gi" "${SYSCONFIG_FILE}"
else
    if [[ -s "${SYSCONFIG_FILE}" ]] && [[ -n "$(tail -c 1 -- "${SYSCONFIG_FILE}" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "${SYSCONFIG_FILE}"
    fi
    printf '%s\n' "$formatted_output" >> "${SYSCONFIG_FILE}"
fi