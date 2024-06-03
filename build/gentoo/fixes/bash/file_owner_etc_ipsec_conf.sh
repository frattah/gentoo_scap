# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q libreswan; then

chown 0 /etc/ipsec.conf

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi