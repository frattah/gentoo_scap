# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove tcpd
#	   from the system, and may remove any packages
#	   that depend on tcpd. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "tcpd" ; then

    yum remove -y "tcpd"

fi