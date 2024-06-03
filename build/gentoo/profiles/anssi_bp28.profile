description: Pass
extends: null
hidden: ''
metadata:
    SMEs:
    - frattah
reference: null
selections:
- accounts_password_pam_dcredit
- accounts_password_pam_lcredit
- accounts_password_pam_minlen
- accounts_password_pam_ocredit
- accounts_password_pam_ucredit
- accounts_password_pam_unix_remember
- accounts_passwords_pam_faillock_deny
- accounts_passwords_pam_faillock_deny_root
- accounts_passwords_pam_faillock_interval
- accounts_tmout
- var_password_pam_minlen=15
- var_password_pam_ocredit=1
- var_password_pam_dcredit=1
- var_password_pam_ucredit=1
- var_accounts_passwords_pam_faillock_fail_interval=900
- var_accounts_passwords_pam_faillock_deny=3
- var_password_pam_lcredit=1
- var_password_pam_unix_remember=2
- var_accounts_tmout=10_min
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
policies: []
title: ANSSI-BP-028
definition_location: /home/frattah/old/products/gentoo/profiles/anssi_bp28.profile
documentation_complete: true
