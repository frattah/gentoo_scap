# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q nftables; then

find -H /etc/nftables/ -maxdepth 1 -perm /u+s,g+xwrs,o+xwrt -type d -exec chmod u-s,g-xwrs,o-xwrt {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi