# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove nfs-kernel-server
#	   from the system, and may remove any packages
#	   that depend on nfs-kernel-server. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "nfs-kernel-server" ; then

    yum remove -y "nfs-kernel-server"

fi