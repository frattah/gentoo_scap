# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if [ -e "/etc/chrony.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*makestep 1 \-1/Id" "/etc/chrony.conf"
else
    touch "/etc/chrony.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/chrony.conf"

cp "/etc/chrony.conf" "/etc/chrony.conf.bak"
# Insert at the end of the file
printf '%s\n' "makestep 1 -1" >> "/etc/chrony.conf"
# Clean up after ourselves.
rm "/etc/chrony.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi