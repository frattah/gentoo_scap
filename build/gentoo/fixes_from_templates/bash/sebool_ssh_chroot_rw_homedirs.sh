# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_ssh_chroot_rw_homedirs='(bash-populate var_ssh_chroot_rw_homedirs)'

    setsebool -P ssh_chroot_rw_homedirs $var_ssh_chroot_rw_homedirs

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi