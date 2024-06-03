# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_httpd_builtin_scripting='(bash-populate var_httpd_builtin_scripting)'

    setsebool -P httpd_builtin_scripting $var_httpd_builtin_scripting

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi