# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_minidlna_read_generic_user_content='(bash-populate var_minidlna_read_generic_user_content)'

    setsebool -P minidlna_read_generic_user_content $var_minidlna_read_generic_user_content

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi