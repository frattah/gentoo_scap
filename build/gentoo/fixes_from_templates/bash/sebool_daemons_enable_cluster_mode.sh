# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_daemons_enable_cluster_mode='(bash-populate var_daemons_enable_cluster_mode)'

    setsebool -P daemons_enable_cluster_mode $var_daemons_enable_cluster_mode

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi