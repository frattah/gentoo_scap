# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_nfs_export_all_rw='(bash-populate var_nfs_export_all_rw)'

    setsebool -P nfs_export_all_rw $var_nfs_export_all_rw

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi