# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

find /lib/  -type f ! -group 0 -regex '^.*$' -exec chgrp 0 {} \;

find /lib64/  -type f ! -group 0 -regex '^.*$' -exec chgrp 0 {} \;

find /usr/lib/  -type f ! -group 0 -regex '^.*$' -exec chgrp 0 {} \;

find /usr/lib64/  -type f ! -group 0 -regex '^.*$' -exec chgrp 0 {} \;