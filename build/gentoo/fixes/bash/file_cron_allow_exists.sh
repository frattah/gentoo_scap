# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

touch /etc/cron.allow
    chown 0 /etc/cron.allow
    chmod 0600 /etc/cron.allow

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi