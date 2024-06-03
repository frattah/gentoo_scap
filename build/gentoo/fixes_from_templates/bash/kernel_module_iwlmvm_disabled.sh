# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
if LC_ALL=C grep -q -m 1 "^install iwlmvm" /etc/modprobe.d/iwlmvm.conf ; then
	
	sed -i 's#^install iwlmvm.*#install iwlmvm /bin/false#g' /etc/modprobe.d/iwlmvm.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/iwlmvm.conf
	echo "install iwlmvm /bin/false" >> /etc/modprobe.d/iwlmvm.conf
fi