# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_xdm_bind_vnc_tcp_port='(bash-populate var_xdm_bind_vnc_tcp_port)'

    setsebool -P xdm_bind_vnc_tcp_port $var_xdm_bind_vnc_tcp_port

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi