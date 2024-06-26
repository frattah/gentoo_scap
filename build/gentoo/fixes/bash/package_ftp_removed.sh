# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove ftp
#	   from the system, and may remove any packages
#	   that depend on ftp. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "ftp" ; then

    yum remove -y "ftp"

fi