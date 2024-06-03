# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove 389-ds-base
#	   from the system, and may remove any packages
#	   that depend on 389-ds-base. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "389-ds-base" ; then

    yum remove -y "389-ds-base"

fi