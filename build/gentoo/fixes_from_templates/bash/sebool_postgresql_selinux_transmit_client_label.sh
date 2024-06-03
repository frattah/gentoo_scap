# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_postgresql_selinux_transmit_client_label='(bash-populate var_postgresql_selinux_transmit_client_label)'

    setsebool -P postgresql_selinux_transmit_client_label $var_postgresql_selinux_transmit_client_label

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi