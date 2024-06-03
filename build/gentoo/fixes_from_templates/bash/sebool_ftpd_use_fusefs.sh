# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_ftpd_use_fusefs='(bash-populate var_ftpd_use_fusefs)'

    setsebool -P ftpd_use_fusefs $var_ftpd_use_fusefs

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi