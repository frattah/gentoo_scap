documentation_complete: true

title: 'ANSSI-BP-028 (intermediary)'

description: |-
    This profile contains configurations that align to ANSSI-BP-028 v2.0 at the intermediary hardening level.

    ANSSI is the French National Information Security Agency, and stands for Agence nationale de la sécurité des systèmes d'information.
    ANSSI-BP-028 is a configuration recommendation for GNU/Linux systems.

    A copy of the ANSSI-BP-028 can be found at the ANSSI website:
    https://www.ssi.gouv.fr/administration/guide/recommandations-de-securite-relatives-a-un-systeme-gnulinux/

selections:
    - anssi:all:intermediary
    # Following rules once had a prodtype incompatible with the ol8 product
    - '!cracklib_accounts_password_pam_minlen'
    - '!accounts_passwords_pam_tally2_deny_root'
    - '!grub2_mds_argument'
    - '!sysctl_fs_protected_fifos'
    - '!accounts_passwords_pam_tally2'
    - '!cracklib_accounts_password_pam_ucredit'
    - '!cracklib_accounts_password_pam_dcredit'
    - '!cracklib_accounts_password_pam_lcredit'
    - '!sysctl_fs_protected_regular'
    - '!cracklib_accounts_password_pam_ocredit'
    - '!grub2_page_alloc_shuffle_argument'
    - '!accounts_passwords_pam_tally2_unlock_time'
    - '!ensure_redhat_gpgkey_installed'
