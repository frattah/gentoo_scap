# platform = multi_platform_all
# reboot = false
# complexity = low
# strategy = configure
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if ! rpm -q --quiet "firewalld" ; then
    yum install -y "firewalld"
fi

ipv4_rule='rule family=ipv4 source address="127.0.0.1" destination not address="127.0.0.1" drop'
ipv6_rule='rule family=ipv6 source address="::1" destination not address="::1" drop'

if test "$(stat -c %d:%i /)" != "$(stat -c %d:%i /proc/1/root/.)"; then
    firewall-offline-cmd --zone=trusted --add-rich-rule="${ipv4_rule}"
    firewall-offline-cmd --zone=trusted --add-rich-rule="${ipv6_rule}"
elif systemctl is-active firewalld; then
    firewall-cmd --permanent --zone=trusted --add-rich-rule="${ipv4_rule}"
    firewall-cmd --permanent --zone=trusted --add-rich-rule="${ipv6_rule}"
    firewall-cmd --reload
else
    echo "
    firewalld service is not active. Remediation aborted!
    This remediation could not be applied because it depends on firewalld service running.
    The service is not started by this remediation in order to prevent connection issues."
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi