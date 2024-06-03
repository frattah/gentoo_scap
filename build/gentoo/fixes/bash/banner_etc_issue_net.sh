# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

remote_login_banner_text='(bash-populate remote_login_banner_text)'


# Multiple regexes transform the banner regex into a usable banner
# 0 - Remove anchors around the banner text
remote_login_banner_text=$(echo "$remote_login_banner_text" | sed 's/^\^\(.*\)\$$/\1/g')
# 1 - Keep only the first banners if there are multiple
#    (dod_banners contains the long and short banner)
remote_login_banner_text=$(echo "$remote_login_banner_text" | sed 's/^(\(.*\.\)|.*)$/\1/g')
# 2 - Add spaces ' '. (Transforms regex for "space or newline" into a " ")
remote_login_banner_text=$(echo "$remote_login_banner_text" | sed 's/\[\\s\\n\]+/ /g')
# 3 - Adds newlines. (Transforms "(?:\[\\n\]+|(?:\\n)+)" into "\n")
remote_login_banner_text=$(echo "$remote_login_banner_text" | sed 's/(?:\[\\n\]+|(?:\\\\n)+)/\n/g')
# 4 - Remove any leftover backslash. (From any parethesis in the banner, for example).
remote_login_banner_text=$(echo "$remote_login_banner_text" | sed 's/\\//g')
formatted=$(echo "$remote_login_banner_text" | fold -sw 80)

cat <<EOF >/etc/issue.net
$formatted
EOF

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi