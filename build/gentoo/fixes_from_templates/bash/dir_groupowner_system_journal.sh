# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
find -H /run/log/journal/  -type d -exec chgrp systemd-journal {} \;
find -H /var/log/journal/  -type d -exec chgrp systemd-journal {} \;