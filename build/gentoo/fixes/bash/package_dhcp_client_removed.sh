# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove dhcp-client
#	   from the system, and may remove any packages
#	   that depend on dhcp-client. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "dhcp-client" ; then

    yum remove -y "dhcp-client"

fi