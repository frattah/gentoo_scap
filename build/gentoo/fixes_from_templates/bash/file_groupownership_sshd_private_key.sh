# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

find /etc/ssh/ -maxdepth 1 -type f ! -group 0 -regex '^.*_key$' -exec chgrp 0 {} \;