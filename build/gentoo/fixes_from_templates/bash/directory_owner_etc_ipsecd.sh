# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
find -H /etc/ipsec.d/ -maxdepth 1 -type d -exec chown 0 {} \;