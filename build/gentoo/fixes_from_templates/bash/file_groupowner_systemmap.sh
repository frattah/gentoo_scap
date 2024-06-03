# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

find /boot/ -maxdepth 1 -type f ! -group root -regex '^.*System\.map.*$' -exec chgrp root {} \;