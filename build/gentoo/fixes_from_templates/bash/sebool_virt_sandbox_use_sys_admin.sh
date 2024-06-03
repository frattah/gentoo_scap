# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_virt_sandbox_use_sys_admin='(bash-populate var_virt_sandbox_use_sys_admin)'

    setsebool -P virt_sandbox_use_sys_admin $var_virt_sandbox_use_sys_admin

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi