# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_httpd_ssi_exec='(bash-populate var_httpd_ssi_exec)'

    setsebool -P httpd_ssi_exec $var_httpd_ssi_exec

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi