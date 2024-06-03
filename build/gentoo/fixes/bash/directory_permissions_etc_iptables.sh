# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q iptables; then

find -H /etc/iptables/ -maxdepth 1 -perm /u+xs,g+xwrs,o+xwrt -type d -exec chmod u-xs,g-xwrs,o-xwrt {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi