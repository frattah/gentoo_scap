# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

find /etc/audit/ -maxdepth 1 -type f ! -group 0 -regex '^audit(\.rules|d\.conf)$' -exec chgrp 0 {} \;

find /etc/audit/rules.d/ -maxdepth 1 -type f ! -group 0 -regex '^.*\.rules$' -exec chgrp 0 {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi