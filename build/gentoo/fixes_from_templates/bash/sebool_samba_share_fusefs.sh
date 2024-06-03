# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_samba_share_fusefs='(bash-populate var_samba_share_fusefs)'

    setsebool -P samba_share_fusefs $var_samba_share_fusefs

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi