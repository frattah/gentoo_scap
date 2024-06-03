# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_httpd_tmp_exec='(bash-populate var_httpd_tmp_exec)'

    setsebool -P httpd_tmp_exec $var_httpd_tmp_exec

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi