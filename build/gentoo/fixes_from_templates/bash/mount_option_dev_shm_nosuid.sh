# platform = multi_platform_all
# reboot = false

function perform_remediation {
    


    mount_point_match_regexp="$(printf "^[[:space:]]*[^#].*[[:space:]]%s[[:space:]]" /dev/shm)"

    # If the mount point is not in /etc/fstab, get previous mount options from /etc/mtab
    if ! grep -q "$mount_point_match_regexp" /etc/fstab; then
        # runtime opts without some automatic kernel/userspace-added defaults
        previous_mount_opts=$(grep "$mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
                    | sed -E "s/(rw|defaults|seclabel|nosuid)(,|$)//g;s/,$//")
        [ "$previous_mount_opts" ] && previous_mount_opts+=","
        # In iso9660 filesystems mtab could describe a "blocksize" value, this should be reflected in
        # fstab as "block".  The next variable is to satisfy shellcheck SC2050.
        fs_type="tmpfs"
        if [  "$fs_type" == "iso9660" ] ; then
            previous_mount_opts=$(sed 's/blocksize=/block=/' <<< "$previous_mount_opts")
        fi
        echo "tmpfs /dev/shm tmpfs defaults,${previous_mount_opts}nosuid 0 0" >> /etc/fstab
    # If the mount_opt option is not already in the mount point's /etc/fstab entry, add it
    elif ! grep "$mount_point_match_regexp" /etc/fstab | grep -q "nosuid"; then
        previous_mount_opts=$(grep "$mount_point_match_regexp" /etc/fstab | awk '{print $4}')
        sed -i "s|\(${mount_point_match_regexp}.*${previous_mount_opts}\)|\1,nosuid|" /etc/fstab
    fi


    if mkdir -p "/dev/shm"; then
        if mountpoint -q "/dev/shm"; then
            mount -o remount --target "/dev/shm"
        fi
    fi
}

perform_remediation