# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /boot/ -maxdepth 1 -perm /u+xs,g+xwrs,o+xwrt  -type f -regex '^.*System\.map.*$' -exec chmod u-xs,g-xwrs,o-xwrt {} \;