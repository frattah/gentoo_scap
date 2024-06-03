# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /etc/sudoers.d/ -maxdepth 1 -perm /u+s,g+ws,o+xwrt -type d -exec chmod u-s,g-ws,o-xwrt {} \;
