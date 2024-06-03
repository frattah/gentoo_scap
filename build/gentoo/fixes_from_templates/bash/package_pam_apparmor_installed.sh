# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle,multi_platform_debian
# reboot = false
# strategy = enable
# complexity = low
# disruption = low

if ! rpm -q --quiet "pam_apparmor" ; then
    yum install -y "pam_apparmor"
fi