# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_xend_run_qemu='(bash-populate var_xend_run_qemu)'

    setsebool -P xend_run_qemu $var_xend_run_qemu

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi