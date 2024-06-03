# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

find -H /run/log/journal/  -type d -exec chgrp systemd-journal {} \;
find -H /var/log/journal/  -type d -exec chgrp systemd-journal {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi