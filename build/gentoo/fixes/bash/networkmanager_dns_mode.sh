# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if rpm --quiet -q NetworkManager; then

var_networkmanager_dns_mode='(bash-populate var_networkmanager_dns_mode)'



# Try find '[main]' and 'dns' in '/etc/NetworkManager/NetworkManager.conf', if it exists, set
# to '$var_networkmanager_dns_mode', if it isn't here, add it, if '[main]' doesn't exist, add it there
if grep -qzosP '[[:space:]]*\[main]([^\n\[]*\n+)+?[[:space:]]*dns' '/etc/NetworkManager/NetworkManager.conf'; then
    
    sed -i "s/dns[^(\n)]*/dns=$var_networkmanager_dns_mode/" '/etc/NetworkManager/NetworkManager.conf'
elif grep -qs '[[:space:]]*\[main]' '/etc/NetworkManager/NetworkManager.conf'; then
    sed -i "/[[:space:]]*\[main]/a dns=$var_networkmanager_dns_mode" '/etc/NetworkManager/NetworkManager.conf'
else
    if test -d "/etc/NetworkManager"; then
        printf '%s\n' '[main]' "dns=$var_networkmanager_dns_mode" >> '/etc/NetworkManager/NetworkManager.conf'
    else
        echo "Config file directory '/etc/NetworkManager' doesnt exist, not remediating, assuming non-applicability." >&2
    fi
fi

systemctl reload NetworkManager

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi