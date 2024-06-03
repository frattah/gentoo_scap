# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q libreswan; then

chgrp root /etc/ipsec.secrets

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi