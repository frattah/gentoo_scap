# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_spamassassin_can_network='(bash-populate var_spamassassin_can_network)'

    setsebool -P spamassassin_can_network $var_spamassassin_can_network

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi