# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

find /boot/ -maxdepth 1 -type f ! -uid 0 -regex '^.*System\.map.*$' -exec chown 0 {} \;