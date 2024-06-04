documentation_complete: true

title: 'DRAFT - ANSSI-BP-028 (high)'

description: |-
    This profile contains configurations that align to ANSSI-BP-028 at the high hardening level.

    ANSSI is the French National Information Security Agency, and stands for Agence nationale de la sécurité des systèmes d'information.
    ANSSI-BP-028 is a configuration recommendation for GNU/Linux systems.

    A copy of the ANSSI-BP-028 can be found at the ANSSI website:
    https://www.ssi.gouv.fr/administration/guide/recommandations-de-securite-relatives-a-un-systeme-gnulinux/

selections:
    - anssi:all:high
    # Following rules once had a prodtype incompatible with the rhcos4 product
    - '!aide_verify_acls'
    - '!accounts_password_pam_dcredit'
    - '!sebool_ssh_sysadm_login'
    - '!kernel_config_refcount_full'
    - '!partition_for_boot'
    - '!accounts_passwords_pam_faillock_deny_root'
    - '!sysctl_fs_protected_regular'
    - '!cracklib_accounts_password_pam_lcredit'
    - '!kernel_config_sched_stack_end_check'
    - '!dnf-automatic_apply_updates'
    - '!cracklib_accounts_password_pam_ocredit'
    - '!enable_pam_namespace'
    - '!package_talk_removed'
    - '!audit_rules_privileged_commands_insmod'
    - '!accounts_password_pam_minlen'
    - '!accounts_password_pam_unix_rounds_system_auth'
    - '!sudo_dedicated_group'
    - '!chronyd_configure_pool_and_server'
    - '!grub2_page_poison_argument'
    - '!ensure_gpgcheck_local_packages'
    - '!sebool_selinuxuser_execstack'
    - '!kernel_config_slab_freelist_hardened'
    - '!kernel_config_slab_merge_default'
    - '!package_xinetd_removed'
    - '!package_rsh-server_removed'
    - '!mount_option_srv_nosuid'
    - '!audit_sudo_log_events'
    - '!mount_option_boot_noexec'
    - '!kernel_config_gcc_plugin_structleak_byref_all'
    - '!sysctl_net_ipv6_conf_default_router_solicitations'
    - '!package_ypserv_removed'
    - '!sebool_selinuxuser_execheap'
    - '!security_patches_up_to_date'
    - '!rsyslog_remote_tls'
    - '!accounts_passwords_pam_faillock_unlock_time'
    - '!file_permissions_ungroupowned'
    - '!set_password_hashing_algorithm_systemauth'
    - '!sysctl_net_ipv6_conf_all_accept_ra_defrtr'
    - '!package_tftp-server_removed'
    - '!package_rsh_removed'
    - '!package_dnf-automatic_installed'
    - '!audit_rules_privileged_commands_modprobe'
    - '!sysctl_kernel_perf_event_max_sample_rate'
    - '!kernel_config_stackprotector_strong'
    - '!sysctl_net_ipv6_conf_all_accept_ra_pinfo'
    - '!sysctl_kernel_perf_cpu_time_max_percent'
    - '!kernel_config_page_poisoning'
    - '!timer_dnf-automatic_enabled'
    - '!accounts_passwords_pam_tally2'
    - '!accounts_password_pam_unix_remember'
    - '!kernel_config_vmap_stack'
    - '!file_permissions_unauthorized_sgid'
    - '!sysctl_net_ipv6_conf_all_router_solicitations'
    - '!sudo_add_umask'
    - '!sudo_add_env_reset'
    - '!package_dhcp_removed'
    - '!aide_scan_notification'
    - '!audit_rules_privileged_commands_kmod'
    - '!sysctl_fs_protected_fifos'
    - '!kernel_config_strict_kernel_rwx'
    - '!kernel_config_slab_freelist_random'
    - '!kernel_config_hardened_usercopy'
    - '!grub2_page_alloc_shuffle_argument'
    - '!mount_option_var_noexec'
    - '!accounts_password_pam_ucredit'
    - '!ensure_gpgcheck_never_disabled'
    - '!mount_option_opt_nosuid'
    - '!partition_for_opt'
    - '!sysctl_kernel_sysrq'
    - '!aide_periodic_cron_checking'
    - '!sysctl_net_ipv6_conf_all_accept_ra_rtr_pref'
    - '!postfix_network_listening_disabled'
    - '!install_PAE_kernel_on_x86-32'
    - '!sysctl_kernel_modules_disabled'
    - '!sebool_secure_mode_insmod'
    - '!kernel_config_hardened_usercopy_fallback'
    - '!accounts_passwords_pam_faillock_interval'
    - '!sudo_add_ignore_dot'
    - '!sysctl_net_ipv6_conf_default_autoconf'
    - '!sysctl_net_ipv6_conf_default_max_addresses'
    - '!kernel_config_gcc_plugin_latent_entropy'
    - '!sysctl_net_ipv6_conf_default_accept_ra_rtr_pref'
    - '!grub2_mds_argument'
    - '!audit_rules_privileged_commands_rmmod'
    - '!grub2_slub_debug_argument'
    - '!dnf-automatic_security_updates_only'
    - '!partition_for_usr'
    - '!package_telnet-server_removed'
    - '!kernel_config_gcc_plugin_stackleak'
    - '!kernel_config_arm64_sw_ttbr0_pan'
    - '!sysctl_net_ipv4_ip_local_port_range'
    - '!package_talk-server_removed'
    - '!sysctl_kernel_pid_max'
    - '!package_ypbind_removed'
    - '!sysctl_net_ipv6_conf_all_max_addresses'
    - '!cracklib_accounts_password_pam_ucredit'
    - '!kernel_config_legacy_vsyscall_xonly'
    - '!kernel_config_gcc_plugin_randstruct'
    - '!accounts_passwords_pam_tally2_unlock_time'
    - '!cracklib_accounts_password_pam_minlen'
    - '!kernel_config_debug_wx'
    - '!sebool_polyinstantiation_enabled'
    - '!package_tftp_removed'
    - '!kernel_config_strict_module_rwx'
    - '!kernel_config_modify_ldt_syscall'
    - '!aide_verify_ext_attributes'
    - '!grub2_pti_argument'
    - '!file_permissions_unauthorized_suid'
    - '!package_rsyslog-gnutls_installed'
    - '!accounts_passwords_pam_tally2_deny_root'
    - '!kernel_config_legacy_vsyscall_none'
    - '!accounts_passwords_pam_faillock_deny'
    - '!accounts_password_pam_unix_rounds_password_auth'
    - '!aide_periodic_checking_systemd_timer'
    - '!sysctl_vm_mmap_min_addr'
    - '!sysctl_net_ipv4_tcp_rfc1337'
    - '!sysctl_net_ipv6_conf_default_accept_ra_pinfo'
    - '!accounts_password_pam_ocredit'
    - '!accounts_password_pam_lcredit'
    - '!no_files_unowned_by_user'
    - '!kernel_config_bug_on_data_corruption'
    - '!kernel_config_legacy_vsyscall_emulate'
    - '!mount_option_home_noexec'
    - '!sysctl_net_ipv4_conf_all_drop_gratuitous_arp'
    - '!sebool_deny_execmem'
    - '!rsyslog_remote_tls_cacert'
    - '!sysctl_net_ipv6_conf_default_accept_ra_defrtr'
    - '!kernel_config_stackprotector'
    - '!kernel_config_gcc_plugin_structleak'
    - '!enable_authselect'
    - '!package_telnet_removed'
    - '!grub2_password'
    - '!package_setroubleshoot_removed'
    - '!kernel_config_fortify_source'
    - '!dir_perms_world_writable_root_owned'
    - '!cracklib_accounts_password_pam_dcredit'
    - '!ensure_gpgcheck_globally_activated'
    - '!sysctl_net_ipv6_conf_all_autoconf'
    - '!ensure_oracle_gpgkey_installed'
