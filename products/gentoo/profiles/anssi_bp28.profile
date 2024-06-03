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
   - accounts_passwords_pam_faillock_interval
   - var_accounts_passwords_pam_faillock_fail_interval=900
   - accounts_passwords_pam_faillock_deny
   - accounts_passwords_pam_faillock_deny_root
   - var_accounts_passwords_pam_faillock_deny=3
   - var_password_pam_lcredit=1 # (-1)
   - accounts_password_pam_unix_remember
   - var_password_pam_unix_remember=2
   - accounts_tmout
   - var_accounts_tmout=10_min
