# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove systemd-timesyncd
#	   from the system, and may remove any packages
#	   that depend on systemd-timesyncd. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "systemd-timesyncd" ; then

    yum remove -y "systemd-timesyncd"

fi