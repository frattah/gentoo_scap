# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_mcelog_exec_scripts='(bash-populate var_mcelog_exec_scripts)'

    setsebool -P mcelog_exec_scripts $var_mcelog_exec_scripts

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi