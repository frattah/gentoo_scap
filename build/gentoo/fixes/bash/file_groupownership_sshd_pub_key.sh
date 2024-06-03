# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

find /etc/ssh/ -maxdepth 1 -type f ! -group 0 -regex '^.*\.pub$' -exec chgrp 0 {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi