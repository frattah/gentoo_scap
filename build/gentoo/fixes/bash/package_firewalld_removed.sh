# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

# CAUTION: This remediation script will remove firewalld
#	   from the system, and may remove any packages
#	   that depend on firewalld. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "firewalld" ; then

    yum remove -y "firewalld"

fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi