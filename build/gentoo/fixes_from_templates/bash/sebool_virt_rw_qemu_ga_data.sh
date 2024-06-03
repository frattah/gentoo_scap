# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_virt_rw_qemu_ga_data='(bash-populate var_virt_rw_qemu_ga_data)'

    setsebool -P virt_rw_qemu_ga_data $var_virt_rw_qemu_ga_data

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi