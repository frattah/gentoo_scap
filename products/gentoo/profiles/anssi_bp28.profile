documentation_complete: true

metadata:
    SMEs:
        - frattah

title: 'ANSSI-BP-028'

description: |-
   Pass

selections:
   - accounts_password_pam_minlen
   - var_password_pam_minlen=15
   - accounts_password_pam_ocredit
   - var_password_pam_ocredit=1 # (-1)
   - accounts_password_pam_dcredit
   - var_password_pam_dcredit=1 # (-1)
   - accounts_password_pam_ucredit
   - var_password_pam_ucredit=1 # (-1)
   - accounts_password_pam_lcredit
   - var_password_pam_lcredit=1 # (-1)
   - accounts_password_pam_unix_remember
   - var_password_pam_unix_remember=2
   - accounts_tmout
   - var_accounts_tmout=10_min
   - accounts_umask_etc_bashrc
   - accounts_umask_etc_login_defs
   - accounts_umask_etc_profile
   - var_accounts_user_umask=077
   - sudo_add_noexec
   - sudo_add_requiretty
   - sudo_add_use_pty
   - sudo_add_umask
   - var_sudo_umask=0077
   - sudo_add_ignore_dot
   - sudo_add_env_reset
