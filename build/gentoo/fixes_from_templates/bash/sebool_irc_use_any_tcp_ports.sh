# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_irc_use_any_tcp_ports='(bash-populate var_irc_use_any_tcp_ports)'

    setsebool -P irc_use_any_tcp_ports $var_irc_use_any_tcp_ports

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi