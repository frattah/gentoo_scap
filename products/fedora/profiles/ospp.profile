documentation_complete: true

title: 'OSPP - Protection Profile for General Purpose Operating Systems'

description: |-
    This profile reflects mandatory configuration controls identified in the
    NIAP Configuration Annex to the Protection Profile for General Purpose
    Operating Systems (Protection Profile Version 4.2).

    As Fedora OS is moving target, this profile does not guarantee to provide
    security levels required from US National Security Systems. Main goal of
    the profile is to provide Fedora developers with hardened environment
    similar to the one mandated by US National Security Systems.

selections:
    - installed_OS_is_vendor_supported
    - grub2_audit_argument
    - grub2_audit_backlog_limit_argument
    - service_auditd_enabled
    - enable_fips_mode
    - var_system_crypto_policy=fips
    - rpm_verify_hashes
    - selinux_all_devicefiles_labeled
    - selinux_confinement_of_daemons
    - selinux_policytype
    - selinux_state
    - audit_rules_immutable
    - var_selinux_policy_name=targeted
    - var_selinux_state=enforcing
    - var_password_pam_minlen=12
    - accounts_password_pam_minlen
    - var_password_pam_ocredit=1
    - accounts_password_pam_ocredit
    - var_password_pam_dcredit=1
    - accounts_password_pam_dcredit
    - var_password_pam_ucredit=1
    - accounts_password_pam_ucredit
    - var_password_pam_lcredit=1
    - accounts_password_pam_lcredit
    - package_screen_installed
    - sysctl_kernel_yama_ptrace_scope
    - sysctl_kernel_kptr_restrict
    - sysctl_kernel_kexec_load_disabled
    - sysctl_user_max_user_namespaces
    - sysctl_kernel_dmesg_restrict
    - sysctl_kernel_perf_event_paranoid
    - sysctl_kernel_unprivileged_bpf_disabled
    - sysctl_net_core_bpf_jit_harden
    - sysctl_kernel_core_pattern
    - coredump_disable_storage
    - coredump_disable_backtraces
    - service_systemd-coredump_disabled
    - dconf_db_up_to_date
    - dconf_gnome_screensaver_idle_activation_enabled
    - dconf_gnome_screensaver_idle_delay
    - dconf_gnome_screensaver_lock_delay
    - dconf_gnome_screensaver_lock_enabled
    - dconf_gnome_screensaver_mode_blank
    - dconf_gnome_screensaver_user_info
    - dconf_gnome_screensaver_user_locks
    - dconf_gnome_session_idle_user_locks
    - accounts_tmout
    - var_accounts_tmout=10_min
    - grub2_password
    - grub2_uefi_password
    - grub2_disable_interactive_boot
    - grub2_slub_debug_argument
    - grub2_page_poison_argument
    - grub2_vsyscall_argument
    - grub2_pti_argument
    - no_empty_passwords
    - require_singleuser_auth
    - service_debug-shell_disabled
    - sshd_disable_empty_passwords
    - sshd_disable_root_login
    - gnome_gdm_disable_automatic_login
    - gnome_gdm_disable_guest_login
    - sssd_run_as_sssd_user
    - disable_host_auth
    - sshd_disable_gssapi_auth
    - sshd_disable_kerb_auth
    - var_accounts_passwords_pam_faillock_deny=3
    - var_accounts_passwords_pam_faillock_fail_interval=900
    - var_accounts_passwords_pam_faillock_unlock_time=never
    - var_password_pam_retry=3
    - accounts_password_pam_retry
    - accounts_passwords_pam_faillock_deny_root
    - accounts_passwords_pam_faillock_deny
    - accounts_passwords_pam_faillock_interval
    - accounts_passwords_pam_faillock_unlock_time
    - dconf_gnome_login_retries
    - service_firewalld_enabled
    - set_firewalld_default_zone
    - auditd_audispd_syslog_plugin_activated
    - auditd_audispd_configure_remote_server
    - auditd_local_events
    - auditd_log_format
    - auditd_write_logs
    - auditd_name_format
    - auditd_freq
    - rsyslog_remote_loghost
    - auditd_audispd_encrypt_sent_records
    - login_banner_text=usgcb_default
    - sshd_enable_warning_banner
    - banner_etc_issue
    - sshd_rekey_limit
    - dconf_gnome_banner_enabled
    - dconf_gnome_login_banner_text
    - audit_rules_login_events_faillock
    - audit_rules_login_events_lastlog
    - audit_rules_login_events_tallylog
    - audit_rules_unsuccessful_file_modification_creat
    - audit_rules_unsuccessful_file_modification_openat_o_creat
    - audit_rules_unsuccessful_file_modification_openat_o_trunc_write
    - audit_rules_unsuccessful_file_modification_openat
    - audit_rules_unsuccessful_file_modification_openat_rule_order
    - audit_rules_unsuccessful_file_modification_open_by_handle_at_o_creat
    - audit_rules_unsuccessful_file_modification_open_by_handle_at_o_trunc_write
    - audit_rules_unsuccessful_file_modification_open_by_handle_at
    - audit_rules_unsuccessful_file_modification_open_by_handle_at_rule_order
    - audit_rules_unsuccessful_file_modification_open_o_creat
    - audit_rules_unsuccessful_file_modification_open_o_trunc_write
    - audit_rules_unsuccessful_file_modification_open
    - audit_rules_unsuccessful_file_modification_open_rule_order
    - audit_rules_unsuccessful_file_modification_ftruncate
    - audit_rules_unsuccessful_file_modification_truncate
    - audit_rules_unsuccessful_file_modification_unlink
    - audit_rules_unsuccessful_file_modification_unlinkat
    - audit_rules_unsuccessful_file_modification_rename
    - audit_rules_unsuccessful_file_modification_renameat
    - audit_rules_file_deletion_events_renameat
    - audit_rules_file_deletion_events_rename
    - audit_rules_file_deletion_events_rmdir
    - audit_rules_file_deletion_events_unlinkat
    - audit_rules_file_deletion_events_unlink
    - audit_rules_dac_modification_chmod
    - audit_rules_dac_modification_fchmodat
    - audit_rules_dac_modification_fchmod
    - audit_rules_dac_modification_fremovexattr
    - audit_rules_dac_modification_fsetxattr
    - audit_rules_dac_modification_lremovexattr
    - audit_rules_dac_modification_lsetxattr
    - audit_rules_dac_modification_removexattr
    - audit_rules_dac_modification_setxattr
    - audit_rules_unsuccessful_file_modification_chmod
    - audit_rules_unsuccessful_file_modification_fchmodat
    - audit_rules_unsuccessful_file_modification_fchmod
    - audit_rules_unsuccessful_file_modification_fremovexattr
    - audit_rules_unsuccessful_file_modification_fsetxattr
    - audit_rules_unsuccessful_file_modification_lremovexattr
    - audit_rules_unsuccessful_file_modification_lsetxattr
    - audit_rules_unsuccessful_file_modification_removexattr
    - audit_rules_unsuccessful_file_modification_setxattr
    - audit_rules_execution_chcon
    - audit_rules_execution_restorecon
    - audit_rules_execution_semanage
    - audit_rules_execution_seunshare
    - audit_rules_execution_setsebool
    - audit_rules_mac_modification
    - audit_rules_dac_modification_chown
    - audit_rules_unsuccessful_file_modification_chown
    - audit_rules_dac_modification_fchownat
    - audit_rules_unsuccessful_file_modification_fchownat
    - audit_rules_dac_modification_fchown
    - audit_rules_unsuccessful_file_modification_fchown
    - audit_rules_dac_modification_lchown
    - audit_rules_unsuccessful_file_modification_lchown
    - audit_rules_privileged_commands_at
    - audit_rules_privileged_commands_crontab
    - audit_rules_privileged_commands_mount
    - audit_rules_privileged_commands_umount
    - audit_rules_privileged_commands_passwd
    - audit_rules_privileged_commands_unix_chkpwd
    - audit_rules_privileged_commands_userhelper
    - audit_rules_privileged_commands_usernetctl
    - audit_rules_privileged_commands_chage
    - audit_rules_privileged_commands_chsh
    - audit_rules_sysadmin_actions
    - audit_rules_privileged_commands_gpasswd
    - audit_rules_privileged_commands_newgidmap
    - audit_rules_privileged_commands_newgrp
    - audit_rules_privileged_commands_newuidmap
    - audit_rules_usergroup_modification_group
    - audit_rules_usergroup_modification_gshadow
    - audit_rules_usergroup_modification_opasswd
    - audit_rules_usergroup_modification_passwd
    - audit_rules_usergroup_modification_shadow
    - audit_rules_privileged_commands_sudoedit
    - audit_rules_privileged_commands_sudo
    - audit_rules_privileged_commands_su
    - audit_rules_session_events
    - directory_access_var_log_audit
    - ensure_fedora_gpgkey_installed
    - ensure_gpgcheck_globally_activated
    - ensure_gpgcheck_never_disabled
    - ensure_gpgcheck_local_packages
    - audit_rules_privileged_commands_ssh_keysign
    - rsyslog_cron_logging
    - audit_rules_kernel_module_loading_delete
    - audit_rules_kernel_module_loading_init
    - audit_rules_etc_passwd_open
    - audit_rules_etc_passwd_openat
    - audit_rules_etc_passwd_open_by_handle_at
    - audit_rules_etc_group_open
    - audit_rules_etc_group_openat
    - audit_rules_etc_group_open_by_handle_at
    - audit_rules_etc_shadow_open
    - audit_rules_etc_shadow_openat
    - audit_rules_etc_shadow_open_by_handle_at
    - audit_rules_etc_gshadow_open
    - audit_rules_etc_gshadow_openat
    - audit_rules_etc_gshadow_open_by_handle_at
    - package_abrt_removed
    - package_sendmail_removed
    - mount_option_dev_shm_nodev
    - mount_option_dev_shm_noexec
    - mount_option_dev_shm_nosuid
    - configure_ssh_crypto_policy
    - configure_libreswan_crypto_policy
    - configure_openssl_crypto_policy
    - configure_kerberos_crypto_policy
    - configure_bind_crypto_policy
    - configure_crypto_policy
    - chronyd_no_chronyc_network
    - chronyd_client_only
    - kernel_module_atm_disabled
    - kernel_module_can_disabled
    - kernel_module_firewire-core_disabled
    - kernel_module_tipc_disabled
    - dnf-automatic_apply_updates
    - package_fapolicyd_installed
    - dnf-automatic_security_updates_only
    - package_dnf-automatic_installed
    - timer_dnf-automatic_enabled
    - service_rngd_enabled
