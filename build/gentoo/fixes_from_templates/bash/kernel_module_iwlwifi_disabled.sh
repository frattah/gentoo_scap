# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
if LC_ALL=C grep -q -m 1 "^install iwlwifi" /etc/modprobe.d/iwlwifi.conf ; then
	
	sed -i 's#^install iwlwifi.*#install iwlwifi /bin/false#g' /etc/modprobe.d/iwlwifi.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/iwlwifi.conf
	echo "install iwlwifi /bin/false" >> /etc/modprobe.d/iwlwifi.conf
fi