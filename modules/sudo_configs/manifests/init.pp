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

  file_line {"Decrypt at login":
    path => '/etc/pam.d/system-login',
    ensure => present,
    line => 'auth       optional   pam_exec.so expose_authtok /etc/pam_cryptsetup.sh',
    after => 'auth +include +system-auth',
    match => "auth.*pam_cryptsetup.sh",
  }

  file {"/etc/pam_cryptsetup.sh":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/pam_cryptsetup.sh",
    owner => "root",
    mode => "0544",
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

  file_line {"Docker insecure nexus registry":
    path => '/etc/docker/daemon.json',
    ensure => present,
    line => '{ "insecure-registries":["nexus.android.delphiauto.net:5050","nexus.android.delphiauto.net:5000"] }',
    match => "nexus.android.delphiauto.net",
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

  file_line {"Proxy http setting":
    path => '/etc/environment',
    ensure => present,
    line => 'http_proxy="http://127.0.0.1:3128"',
    match => 'http_proxy',
    replace => false,
  }

  file_line {"Proxy https setting":
    path => '/etc/environment',
    ensure => present,
    line => 'https_proxy="http://127.0.0.1:3128"',
    match => 'https_proxy',
    replace => false,
  }

  file_line {"Proxy ftp setting":
    path => '/etc/environment',
    ensure => present,
    line => 'ftp_proxy="http://127.0.0.1:3128"',
    match => 'ftp_proxy',
    replace => false,
  }

  file_line {"No proxy setting":
    path => '/etc/environment',
    ensure => present,
    line => 'NO_PROXY="localhost,127.0.0.1,localaddress"',
    match => 'no_proxy',
    replace => false,
  }

  file_line {"All proxy setting":
    path => '/etc/environment',
    ensure => present,
    line => 'all_proxy="http://127.0.0.1:3128"',
    match => 'all_proxy',
    replace => false,
  }

  file_line {"Proxy HTTP setting":
    path => '/etc/environment',
    ensure => present,
    line => 'HTTP_PROXY="http://127.0.0.1:3128"',
    match => 'HTTP_PROXY',
    replace => false,
  }

  file_line {"Proxy HTTPS setting":
    path => '/etc/environment',
    ensure => present,
    line => 'HTTPS_PROXY="http://127.0.0.1:3128"',
    match => 'HTTPS_PROXY',
    replace => false,
  }

  file_line {"Proxy FTP setting":
    path => '/etc/environment',
    ensure => present,
    line => 'FTP_PROXY="http://127.0.0.1:3128"',
    match => 'FTP_PROXY',
    replace => false,
  }

  file_line {"NO proxy setting":
    path => '/etc/environment',
    ensure => present,
    line => 'NO_PROXY="localhost,127.0.0.1,localaddress"',
    match => 'NO_PROXY',
    replace => false,
  }

  exec {'Add snapper config':
      unless => '/bin/test -f /etc/snapper/configs/root',
      command => "snapper -c root create-config /",
      path => "/usr/bin",
  }

  file_line {'Modify snapper hourly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_HOURLY="5"',
      match => 'TIMELINE_LIMIT_HOURLY',
  }

  file_line {'Modify snapper daily config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_DAILY="7"',
      match => 'TIMELINE_LIMIT_DAILY',
  }

  file_line {'Modify snapper weekly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_WEEKLY="2"',
      match => 'TIMELINE_LIMIT_WEEKLY',
  }

  file_line {'Modify snapper montly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_MONTHLY="0"',
      match => 'TIMELINE_LIMIT_MONTHLY',
  }

  file_line {'Modify snapper yearly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_YEARLY="0"',
      match => 'TIMELINE_LIMIT_YEARLY',
  }
}
