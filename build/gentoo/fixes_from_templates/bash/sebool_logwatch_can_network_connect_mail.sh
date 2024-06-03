# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_logwatch_can_network_connect_mail='(bash-populate var_logwatch_can_network_connect_mail)'

    setsebool -P logwatch_can_network_connect_mail $var_logwatch_can_network_connect_mail

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi