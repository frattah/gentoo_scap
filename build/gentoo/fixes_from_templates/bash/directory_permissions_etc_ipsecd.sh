# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /etc/ipsec.d/ -maxdepth 1 -perm /u+s,g+xwrs,o+xwrt -type d -exec chmod u-s,g-xwrs,o-xwrt {} \;
