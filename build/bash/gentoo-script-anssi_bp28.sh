#!/usr/bin/env bash
###############################################################################
#
# Bash Remediation Script for ANSSI-BP-028
#
# Profile Description:
# Pass
#
# Profile ID:  xccdf_org.ssgproject.content_profile_anssi_bp28
# Benchmark ID:  xccdf_org.ssgproject.content_benchmark_GENTOO
# Benchmark Version:  0.1.73
# XCCDF Version:  1.2
#
# This file can be generated by OpenSCAP using:
# $ oscap xccdf generate fix --profile xccdf_org.ssgproject.content_profile_anssi_bp28 --fix-type bash ssg-gentoo-ds.xml
#
# This Bash Remediation Script is generated from an XCCDF profile without preliminary evaluation.
# It attempts to fix every selected rule, even if the system is already compliant.
#
# How to apply this Bash Remediation Script:
# $ sudo ./remediation-script.sh
#
###############################################################################

###############################################################################
# BEGIN fix (1 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_unix_remember'
###############################################################################
(>&2 echo "Remediating rule 1/10: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_unix_remember'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_unix_remember='2'






if [ -f /usr/bin/authselect ]; then
    if authselect list-features minimal | grep -q with-pwhistory; then
        if ! authselect check; then
        echo "
        authselect integrity check failed. Remediation aborted!
        This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
        It is not recommended to manually edit the PAM files when authselect tool is available.
        In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
        exit 1
        fi
        authselect enable-feature with-pwhistory

        authselect apply-changes -b
    else
        
        if ! authselect check; then
        echo "
        authselect integrity check failed. Remediation aborted!
        This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
        It is not recommended to manually edit the PAM files when authselect tool is available.
        In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
        exit 1
        fi

        CURRENT_PROFILE=$(authselect current -r | awk '{ print $1 }')
        # If not already in use, a custom profile is created preserving the enabled features.
        if [[ ! $CURRENT_PROFILE == custom/* ]]; then
            ENABLED_FEATURES=$(authselect current | tail -n+3 | awk '{ print $2 }')
            authselect create-profile hardening -b $CURRENT_PROFILE
            CURRENT_PROFILE="custom/hardening"
            
            authselect apply-changes -b --backup=before-hardening-custom-profile
            authselect select $CURRENT_PROFILE
            for feature in $ENABLED_FEATURES; do
                authselect enable-feature $feature;
            done
            
            authselect apply-changes -b --backup=after-hardening-custom-profile
        fi
        PAM_FILE_NAME=$(basename "/etc/pam.d/system-auth")
        PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

        authselect apply-changes -b
        if ! grep -qP '^\s*password\s+'"requisite"'\s+pam_pwhistory.so\s*.*' "$PAM_FILE_PATH"; then
            # Line matching group + control + module was not found. Check group + module.
            if [ "$(grep -cP '^\s*password\s+.*\s+pam_pwhistory.so\s*' "$PAM_FILE_PATH")" -eq 1 ]; then
                # The control is updated only if one single line matches.
                sed -i -E --follow-symlinks 's/^(\s*password\s+).*(\bpam_pwhistory.so.*)/\1'"requisite"' \2/' "$PAM_FILE_PATH"
            else
                LAST_MATCH_LINE=$(grep -nP "^password.*requisite.*pam_pwquality\.so" "$PAM_FILE_PATH" | tail -n 1 | cut -d: -f 1)
                if [ ! -z $LAST_MATCH_LINE ]; then
                    sed -i --follow-symlinks $LAST_MATCH_LINE' a password     '"requisite"'    pam_pwhistory.so' "$PAM_FILE_PATH"
                else
                    echo 'password    '"requisite"'    pam_pwhistory.so' >> "$PAM_FILE_PATH"
                fi
            fi
        fi
    fi
else
    if ! grep -qP '^\s*password\s+'"requisite"'\s+pam_pwhistory.so\s*.*' "/etc/pam.d/system-auth"; then
        # Line matching group + control + module was not found. Check group + module.
        if [ "$(grep -cP '^\s*password\s+.*\s+pam_pwhistory.so\s*' "/etc/pam.d/system-auth")" -eq 1 ]; then
            # The control is updated only if one single line matches.
            sed -i -E --follow-symlinks 's/^(\s*password\s+).*(\bpam_pwhistory.so.*)/\1'"requisite"' \2/' "/etc/pam.d/system-auth"
        else
            LAST_MATCH_LINE=$(grep -nP "^password.*requisite.*pam_pwquality\.so" "/etc/pam.d/system-auth" | tail -n 1 | cut -d: -f 1)
            if [ ! -z $LAST_MATCH_LINE ]; then
                sed -i --follow-symlinks $LAST_MATCH_LINE' a password     '"requisite"'    pam_pwhistory.so' "/etc/pam.d/system-auth"
            else
                echo 'password    '"requisite"'    pam_pwhistory.so' >> "/etc/pam.d/system-auth"
            fi
        fi
    fi
fi

PWHISTORY_CONF="/etc/security/pwhistory.conf"
if [ -f $PWHISTORY_CONF ]; then
    regex="^\s*remember\s*="
    line="remember = $var_password_pam_unix_remember"
    if ! grep -q $regex $PWHISTORY_CONF; then
        echo $line >> $PWHISTORY_CONF
    else
        sed -i --follow-symlinks 's|^\s*\(remember\s*=\s*\)\(\S\+\)|\1'"$var_password_pam_unix_remember"'|g' $PWHISTORY_CONF
    fi
    if [ -e "/etc/pam.d/system-auth" ] ; then
        PAM_FILE_PATH="/etc/pam.d/system-auth"
        if [ -f /usr/bin/authselect ]; then
            
            if ! authselect check; then
            echo "
            authselect integrity check failed. Remediation aborted!
            This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
            It is not recommended to manually edit the PAM files when authselect tool is available.
            In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
            exit 1
            fi

            CURRENT_PROFILE=$(authselect current -r | awk '{ print $1 }')
            # If not already in use, a custom profile is created preserving the enabled features.
            if [[ ! $CURRENT_PROFILE == custom/* ]]; then
                ENABLED_FEATURES=$(authselect current | tail -n+3 | awk '{ print $2 }')
                authselect create-profile hardening -b $CURRENT_PROFILE
                CURRENT_PROFILE="custom/hardening"
                
                authselect apply-changes -b --backup=before-hardening-custom-profile
                authselect select $CURRENT_PROFILE
                for feature in $ENABLED_FEATURES; do
                    authselect enable-feature $feature;
                done
                
                authselect apply-changes -b --backup=after-hardening-custom-profile
            fi
            PAM_FILE_NAME=$(basename "/etc/pam.d/system-auth")
            PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

            authselect apply-changes -b
        fi
        
    if grep -qP '^\s*password\s.*\bpam_pwhistory.so\s.*\bremember\b' "$PAM_FILE_PATH"; then
        sed -i -E --follow-symlinks 's/(.*password.*pam_pwhistory.so.*)\bremember\b=?[[:alnum:]]*(.*)/\1\2/g' "$PAM_FILE_PATH"
    fi
        if [ -f /usr/bin/authselect ]; then
            
            authselect apply-changes -b
        fi
    else
        echo "/etc/pam.d/system-auth was not found" >&2
    fi
else
    PAM_FILE_PATH="/etc/pam.d/system-auth"
    if [ -f /usr/bin/authselect ]; then
        
        if ! authselect check; then
        echo "
        authselect integrity check failed. Remediation aborted!
        This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
        It is not recommended to manually edit the PAM files when authselect tool is available.
        In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
        exit 1
        fi

        CURRENT_PROFILE=$(authselect current -r | awk '{ print $1 }')
        # If not already in use, a custom profile is created preserving the enabled features.
        if [[ ! $CURRENT_PROFILE == custom/* ]]; then
            ENABLED_FEATURES=$(authselect current | tail -n+3 | awk '{ print $2 }')
            authselect create-profile hardening -b $CURRENT_PROFILE
            CURRENT_PROFILE="custom/hardening"
            
            authselect apply-changes -b --backup=before-hardening-custom-profile
            authselect select $CURRENT_PROFILE
            for feature in $ENABLED_FEATURES; do
                authselect enable-feature $feature;
            done
            
            authselect apply-changes -b --backup=after-hardening-custom-profile
        fi
        PAM_FILE_NAME=$(basename "/etc/pam.d/system-auth")
        PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

        authselect apply-changes -b
    fi
    if ! grep -qP '^\s*password\s+'"requisite"'\s+pam_pwhistory.so\s*.*' "$PAM_FILE_PATH"; then
        # Line matching group + control + module was not found. Check group + module.
        if [ "$(grep -cP '^\s*password\s+.*\s+pam_pwhistory.so\s*' "$PAM_FILE_PATH")" -eq 1 ]; then
            # The control is updated only if one single line matches.
            sed -i -E --follow-symlinks 's/^(\s*password\s+).*(\bpam_pwhistory.so.*)/\1'"requisite"' \2/' "$PAM_FILE_PATH"
        else
            echo 'password    '"requisite"'    pam_pwhistory.so' >> "$PAM_FILE_PATH"
        fi
    fi
    # Check the option
    if ! grep -qP '^\s*password\s+'"requisite"'\s+pam_pwhistory.so\s*.*\sremember\b' "$PAM_FILE_PATH"; then
        sed -i -E --follow-symlinks '/\s*password\s+'"requisite"'\s+pam_pwhistory.so.*/ s/$/ remember='"$var_password_pam_unix_remember"'/' "$PAM_FILE_PATH"
    else
        sed -i -E --follow-symlinks 's/(\s*password\s+'"requisite"'\s+pam_pwhistory.so\s+.*)('"remember"'=)[[:alnum:]]+\s*(.*)/\1\2'"$var_password_pam_unix_remember"' \3/' "$PAM_FILE_PATH"
    fi
    if [ -f /usr/bin/authselect ]; then
        
        authselect apply-changes -b
    fi
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_unix_remember'

###############################################################################
# BEGIN fix (2 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_dcredit'
###############################################################################
(>&2 echo "Remediating rule 2/10: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_dcredit'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_dcredit='-1'






# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^dcredit")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_password_pam_dcredit"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^dcredit\\>" "/etc/security/pwquality.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^dcredit\\>.*/$escaped_formatted_output/gi" "/etc/security/pwquality.conf"
else
    if [[ -s "/etc/security/pwquality.conf" ]] && [[ -n "$(tail -c 1 -- "/etc/security/pwquality.conf" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/security/pwquality.conf"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/security/pwquality.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_dcredit'

###############################################################################
# BEGIN fix (3 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_lcredit'
###############################################################################
(>&2 echo "Remediating rule 3/10: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_lcredit'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_lcredit='-1'






# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^lcredit")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_password_pam_lcredit"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^lcredit\\>" "/etc/security/pwquality.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^lcredit\\>.*/$escaped_formatted_output/gi" "/etc/security/pwquality.conf"
else
    if [[ -s "/etc/security/pwquality.conf" ]] && [[ -n "$(tail -c 1 -- "/etc/security/pwquality.conf" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/security/pwquality.conf"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/security/pwquality.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_lcredit'

###############################################################################
# BEGIN fix (4 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_minlen'
###############################################################################
(>&2 echo "Remediating rule 4/10: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_minlen'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_minlen='15'






# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^minlen")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_password_pam_minlen"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^minlen\\>" "/etc/security/pwquality.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^minlen\\>.*/$escaped_formatted_output/gi" "/etc/security/pwquality.conf"
else
    if [[ -s "/etc/security/pwquality.conf" ]] && [[ -n "$(tail -c 1 -- "/etc/security/pwquality.conf" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/security/pwquality.conf"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/security/pwquality.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_minlen'

###############################################################################
# BEGIN fix (5 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_ocredit'
###############################################################################
(>&2 echo "Remediating rule 5/10: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_ocredit'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_ocredit='-1'






# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^ocredit")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_password_pam_ocredit"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^ocredit\\>" "/etc/security/pwquality.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^ocredit\\>.*/$escaped_formatted_output/gi" "/etc/security/pwquality.conf"
else
    if [[ -s "/etc/security/pwquality.conf" ]] && [[ -n "$(tail -c 1 -- "/etc/security/pwquality.conf" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/security/pwquality.conf"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/security/pwquality.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_ocredit'

###############################################################################
# BEGIN fix (6 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_ucredit'
###############################################################################
(>&2 echo "Remediating rule 6/10: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_ucredit'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_ucredit='-1'






# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^ucredit")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_password_pam_ucredit"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^ucredit\\>" "/etc/security/pwquality.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^ucredit\\>.*/$escaped_formatted_output/gi" "/etc/security/pwquality.conf"
else
    if [[ -s "/etc/security/pwquality.conf" ]] && [[ -n "$(tail -c 1 -- "/etc/security/pwquality.conf" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/security/pwquality.conf"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/security/pwquality.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_password_pam_ucredit'

###############################################################################
# BEGIN fix (7 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_tmout'
###############################################################################
(>&2 echo "Remediating rule 7/10: 'xccdf_org.ssgproject.content_rule_accounts_tmout'")
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_accounts_tmout='600'


# if 0, no occurence of tmout found, if 1, occurence found
tmout_found=0


for f in /etc/profile /etc/profile.d/*.sh; do

    if grep --silent '^[^#].*TMOUT' $f; then
        sed -i -E "s/^(.*)TMOUT\s*=\s*(\w|\$)*(.*)$/typeset -xr TMOUT=$var_accounts_tmout\3/g" $f
        tmout_found=1
    fi
done

if [ $tmout_found -eq 0 ]; then
        echo -e "\n# Set TMOUT to $var_accounts_tmout per security requirements" >> /etc/profile.d/tmout.sh
        echo "typeset -xr TMOUT=$var_accounts_tmout" >> /etc/profile.d/tmout.sh
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_tmout'

###############################################################################
# BEGIN fix (8 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_bashrc'
###############################################################################
(>&2 echo "Remediating rule 8/10: 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_bashrc'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q bash; then

var_accounts_user_umask='077'






grep -q "^[^#]*\bumask" /etc/bashrc && \
  sed -i -E -e "s/^([^#]*\bumask).*/\1 $var_accounts_user_umask/g" /etc/bashrc
if ! [ $? -eq 0 ]; then
    echo "umask $var_accounts_user_umask" >> /etc/bashrc
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_bashrc'

###############################################################################
# BEGIN fix (9 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_login_defs'
###############################################################################
(>&2 echo "Remediating rule 9/10: 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_login_defs'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q shadow-utils; then

var_accounts_user_umask='077'


# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^UMASK")

# shellcheck disable=SC2059
printf -v formatted_output "%s %s" "$stripped_key" "$var_accounts_user_umask"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^UMASK\\>" "/etc/login.defs"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    LC_ALL=C sed -i --follow-symlinks "s/^UMASK\\>.*/$escaped_formatted_output/gi" "/etc/login.defs"
else
    if [[ -s "/etc/login.defs" ]] && [[ -n "$(tail -c 1 -- "/etc/login.defs" || true)" ]]; then
        LC_ALL=C sed -i --follow-symlinks '$a'\\ "/etc/login.defs"
    fi
    printf '%s\n' "$formatted_output" >> "/etc/login.defs"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_login_defs'

###############################################################################
# BEGIN fix (10 / 10) for 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_profile'
###############################################################################
(>&2 echo "Remediating rule 10/10: 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_profile'")

var_accounts_user_umask='077'


readarray -t profile_files < <(find /etc/profile.d/ -type f -name '*.sh' -or -name 'sh.local')

for file in "${profile_files[@]}" /etc/profile; do
  grep -qE '^[^#]*umask' "$file" && sed -i -E "s/^(\s*umask\s*)[0-7]+/\1$var_accounts_user_umask/g" "$file"
done

if ! grep -qrE '^[^#]*umask' /etc/profile*; then
  echo "umask $var_accounts_user_umask" >> /etc/profile
fi

# END fix for 'xccdf_org.ssgproject.content_rule_accounts_umask_etc_profile'

