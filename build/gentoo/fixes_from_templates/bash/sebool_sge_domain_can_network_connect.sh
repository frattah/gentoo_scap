# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_sge_domain_can_network_connect='(bash-populate var_sge_domain_can_network_connect)'

    setsebool -P sge_domain_can_network_connect $var_sge_domain_can_network_connect

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi