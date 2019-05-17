class sudo_configs ($username = 'hogklint',
        $buildserver = 'core-build-01') {
  file {"/etc/X11/xorg.conf.d/40-libinput.conf":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/40-libinput.conf",
    owner => "root",
  }

  file {"/etc/udev/rules.d/61-android.rules":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/51-android.rules",
    owner => "root",
  }

  file {"/etc/udev/rules.d/95-monitor-changes.rules":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/95-monitor-changes.rules",
    owner => "root",
  }

  file_line {"ntp.conf":
    path => '/etc/ntp.conf',
    ensure => present,
    line => 'server semegot-dc05.mecel.net',
    after => 'NTP pool',
  }

  file_line {"Build server hosts":
    path => '/etc/hosts',
    ensure => present,
    line => "10.239.124.50 $buildserver",
    match => "$buildserver",
  }

  file_line {"fstab_ihu_out":
    path => '/etc/fstab',
    ensure => present,
    line => "$buildserver:/home/$username/ihu/aosp_local/out /home/$username/ihu/aosp_local/out nfs4 rw,defaults,noauto,x-systemd.automount,x-systemd.device-timeout=10,x-systemd.requires=network.target 0 0",
    match => "$buildserver.*ihu.*aosp.*out",
  }

  file_line {"fstab_sem_out":
    path => '/etc/fstab',
    ensure => present,
    line => "$buildserver:/home/$username/sem/aosp_local/out /home/$username/sem/aosp_local/out nfs4 rw,defaults,noauto,x-systemd.automount,x-systemd.device-timeout=10,x-systemd.requires=network.target 0 0",
    match => "$buildserver.*sem.*aosp.*out",
  }

  file {"/home/common":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  user {"$username":
      groups => ['wheel', 'uucp', 'wireshark', 'docker', 'libvirt'],
      membership => minimum,
  }

# Create $username with uid 1003 (same as build server)
# Groups wheel, uucp(ttyUSB), wireshark
}
