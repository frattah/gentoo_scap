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
- accounts_tmout
- accounts_umask_etc_bashrc
- accounts_umask_etc_login_defs
- accounts_umask_etc_profile
- sudo_add_env_reset
- sudo_add_ignore_dot
- sudo_add_noexec
- sudo_add_requiretty
- sudo_add_umask
- sudo_add_use_pty
- var_password_pam_minlen=15
- var_password_pam_ocredit=1
- var_password_pam_dcredit=1
- var_password_pam_ucredit=1
- var_password_pam_lcredit=1
- var_password_pam_unix_remember=2
- var_accounts_tmout=10_min
- var_accounts_user_umask=077
- var_sudo_umask=0077
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
policies: []
title: ANSSI-BP-028
definition_location: /home/fra/gentoo_scap/products/gentoo/profiles/anssi_bp28.profile
documentation_complete: true
