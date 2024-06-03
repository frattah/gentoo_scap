documentation_complete: true

metadata:
    version: '4.0'
    SMEs:
        - hustliyilin
        - rain-Qing

reference: https://docs-prv.pcisecuritystandards.org/PCI%20DSS/Standard/PCI-DSS-v4_0.pdf

title: 'PCI-DSS v4.0 Control Baseline for Anolis OS 23'

description: |-
    Payment Card Industry - Data Security Standard (PCI-DSS) is a set of
    security standards designed to ensure the secure handling of payment card
    data, with the goal of preventing data breaches and protecting sensitive
    financial information.

selections:
    - pcidss_4:all
    - '!package_audit-audispd-plugins_installed'
    - '!rpm_verify_permissions'
    - '!package_audit-audispd-plugins_installed'
    - '!service_ntp_enabled'
    - '!ntpd_specify_remote_server'
    - '!ntpd_specify_multiple_servers'
    - '!set_ipv6_loopback_traffic'
    - '!set_loopback_traffic'
    - '!service_ntpd_enabled'
    - '!package_ypserv_removed'
    - '!package_ypbind_removed'
    - '!package_talk_removed'
    - '!package_talk-server_removed'
    - '!package_xinetd_removed'
    - '!package_rsh_removed'
    - '!package_rsh-server_removed'
    - '!ensure_redhat_gpgkey_installed'
    # Following rules once had a prodtype incompatible with the anolis23 product
    - '!auditd_data_retention_space_left'
    - '!set_firewalld_default_zone'
    - '!accounts_password_pam_dcredit'
    - '!grub2_audit_backlog_limit_argument'
    - '!chronyd_run_as_chrony_user'
    - '!audit_rules_usergroup_modification_opasswd'
    - '!file_group_ownership_var_log_audit'
    - '!cracklib_accounts_password_pam_lcredit'
    - '!cracklib_accounts_password_pam_retry'
    - '!sshd_use_approved_ciphers'
    - '!dconf_gnome_screensaver_idle_activation_enabled'
    - '!file_permissions_etc_issue_net'
    - '!accounts_set_post_pw_existing'
    - '!sudo_require_reauthentication'
    - '!audit_rules_suid_privilege_function'
    - '!audit_rules_usergroup_modification_group'
    - '!accounts_password_set_warn_age_existing'
    - '!file_permissions_user_cfg'
    - '!package_audispd-plugins_installed'
    - '!package_sudo_installed'
    - '!rpm_verify_ownership'
    - '!use_pam_wheel_group_for_su'
    - '!service_nftables_disabled'
    - '!audit_sudo_log_events'
    - '!dconf_gnome_session_idle_user_locks'
    - '!audit_rules_login_events_faillock'
    - '!service_chronyd_or_ntpd_enabled'
    - '!dconf_gnome_screensaver_lock_enabled'
    - '!timer_logrotate_enabled'
    - '!file_owner_user_cfg'
    - '!accounts_passwords_pam_faillock_unlock_time'
    - '!package_tftp-server_removed'
    - '!package_net-snmp_removed'
    - '!ensure_firewall_rules_for_open_ports'
    - '!gnome_gdm_disable_guest_login'
    - '!file_owner_etc_issue_net'
    - '!file_groupowner_etc_issue_net'
    - '!permissions_local_var_log'
    - '!accounts_passwords_pam_tally2'
    - '!accounts_password_pam_unix_remember'
    - '!audit_rules_usergroup_modification_shadow'
    - '!kernel_module_usb-storage_disabled'
    - '!package_dhcp_removed'
    - '!dconf_gnome_disable_automount'
    - '!set_password_hashing_algorithm_commonauth'
    - '!firewalld_loopback_traffic_trusted'
    - '!ensure_shadow_group_empty'
    - '!audit_rules_login_events_tallylog'
    - '!dconf_gnome_disable_automount_open'
    - '!grub2_audit_argument'
    - '!ensure_gpgcheck_never_disabled'
    - '!dconf_gnome_screensaver_lock_delay'
    - '!postfix_network_listening_disabled'
    - '!install_PAE_kernel_on_x86-32'
    - '!grub2_enable_selinux'
    - '!audit_rules_usergroup_modification_gshadow'
    - '!mask_nonessential_services'
    - '!firewalld_loopback_traffic_restricted'
    - '!dconf_gnome_screensaver_idle_delay'
    - '!audit_rules_usergroup_modification_passwd'
    - '!set_password_hashing_algorithm_libuserconf'
    - '!package_nftables_installed'
    - '!package_telnet-server_removed'
    - '!dconf_db_up_to_date'
    - '!bios_enable_execution_restrictions'
    - '!ensure_suse_gpgkey_installed'
    - '!accounts_passwords_pam_tally2_unlock_time'
    - '!selinux_policytype'
    - '!gnome_gdm_disable_automatic_login'
    - '!selinux_confinement_of_daemons'
    - '!cracklib_accounts_password_pam_minlen'
    - '!aide_build_database'
    - '!package_tftp_removed'
    - '!network_nmcli_permissions'
    - '!ensure_pam_wheel_group_empty'
    - '!sysctl_kernel_core_pattern'
    - '!configure_firewalld_ports'
    - '!accounts_passwords_pam_faillock_deny'
    - '!aide_periodic_checking_systemd_timer'
    - '!package_libselinux_installed'
    - '!nftables_ensure_default_deny_policy'
    - '!accounts_password_pam_lcredit'
    - '!no_files_unowned_by_user'
    - '!dconf_gnome_screensaver_mode_blank'
    - '!package_ftp_removed'
    - '!sshd_use_strong_kex'
    - '!sshd_use_approved_macs'
    - '!no_password_auth_for_systemaccounts'
    - '!auditd_name_format'
    - '!file_groupowner_user_cfg'
    - '!set_password_hashing_algorithm_logindefs'
    - '!directory_access_var_log_audit'
    - '!ensure_root_password_configured'
    - '!file_permissions_var_log_audit'
    - '!gnome_gdm_disable_unattended_automatic_login'
    - '!audit_rules_login_events_lastlog'
    - '!enable_authselect'
    - '!package_telnet_removed'
    - '!cracklib_accounts_password_pam_dcredit'
    - '!network_sniffer_disabled'
    - '!service_timesyncd_enabled'
    - '!package_cryptsetup-luks_installed'