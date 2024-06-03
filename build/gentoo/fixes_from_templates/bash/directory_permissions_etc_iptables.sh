# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /etc/iptables/ -maxdepth 1 -perm /u+xs,g+xwrs,o+xwrt -type d -exec chmod u-xs,g-xwrs,o-xwrt {} \;
