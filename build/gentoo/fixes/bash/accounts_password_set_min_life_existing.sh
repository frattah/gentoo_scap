# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

var_accounts_minimum_age_login_defs='(bash-populate var_accounts_minimum_age_login_defs)'


while IFS= read -r i; do
    
    chage -m $var_accounts_minimum_age_login_defs $i

done <   <(awk -v var="$var_accounts_minimum_age_login_defs" -F: '(/^[^:]+:[^!*]/ && ($4 < var || $4 == "")) {print $1}' /etc/shadow)