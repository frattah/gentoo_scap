# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

find /etc/ssh/ -maxdepth 1 -type f ! -group 0 -regex '^.*\.pub$' -exec chgrp 0 {} \;