# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

find -H /run/log/journal/  -perm /u+s,g+w,o+xwrt -type d -exec chmod u-s,g-w,o-xwrt {} \;

find -H /var/log/journal/  -perm /u+s,g+w,o+xwrt -type d -exec chmod u-s,g-w,o-xwrt {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi