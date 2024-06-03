# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

find /etc/ssh/ -maxdepth 1 -type f ! -uid 0 -regex '^.*_key$' -exec chown 0 {} \;