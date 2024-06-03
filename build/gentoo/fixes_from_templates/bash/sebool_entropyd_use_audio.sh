# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


if ! rpm -q --quiet "libsemanage-python" ; then
    yum install -y "libsemanage-python"
fi


if selinuxenabled; then

    var_entropyd_use_audio='(bash-populate var_entropyd_use_audio)'

    setsebool -P entropyd_use_audio $var_entropyd_use_audio

else
    echo "Skipping remediation, SELinux is disabled";
    false
fi