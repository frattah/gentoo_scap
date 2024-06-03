# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q iptables; then

# CAUTION: This remediation script will remove iptables-persistent
#	   from the system, and may remove any packages
#	   that depend on iptables-persistent. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "iptables-persistent" ; then

    yum remove -y "iptables-persistent"

fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi