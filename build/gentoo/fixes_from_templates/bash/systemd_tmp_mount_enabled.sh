# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low

SYSTEMCTL_EXEC='/usr/bin/systemctl'
"$SYSTEMCTL_EXEC" unmask 'tmp.mount'
"$SYSTEMCTL_EXEC" start 'tmp.mount'
"$SYSTEMCTL_EXEC" enable 'tmp.mount'