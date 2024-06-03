# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if rpm --quiet -q yum; then

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^localpkg_gpgcheck")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "1"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^localpkg_gpgcheck\\>" "/etc/yum.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^localpkg_gpgcheck\\>.*/$escaped_formatted_output/gi" "/etc/yum.conf"
else
    if [[ -s "/etc/yum.conf" ]] && [[ -n "$(tail -c 1 -- "/etc/yum.conf" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/yum.conf"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/yum.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi