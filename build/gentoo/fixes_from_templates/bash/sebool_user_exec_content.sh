# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_user_exec_content='(bash-populate var_user_exec_content)'

    setsebool -P user_exec_content $var_user_exec_content

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi