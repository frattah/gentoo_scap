# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
find -H /etc/sudoers.d/ -maxdepth 1 -type d -exec chgrp root {} \;