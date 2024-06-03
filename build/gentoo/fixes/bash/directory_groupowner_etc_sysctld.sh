# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

find -H /etc/sysctl.d/ -maxdepth 1 -type d -exec chgrp root {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi