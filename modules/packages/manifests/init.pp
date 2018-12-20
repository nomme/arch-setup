class packages {
  $base_packages = [
    'bind-tools',
    'curl',
    'git',
    'htop',
    'glances',
    'sysstat',
    'openssh',
    'sudo',
    'tmux',
    'traceroute',
    'tree',
    'unzip',
    'gvim',
    'zsh',
  ]
  package { $base_packages: ensure => 'installed' }

  $devel_packages = [
    'base-devel',
    'the_silver_searcher',
    'tig',
    'strace',
    'jq',
    'lldb',
    'llvm',
    'cmake',
    'lsof',
    'picocom',
    'ctags',
    'doxygen',
    ]
  package { $devel_packages: ensure => 'installed' }

  $sound_packages = [
    'alsa-utils',
    'pulseaudio',
    'pavucontrol',
    ]
  package { $sound_packages: ensure => 'installed' }

  $network_packages = [
    'networkmanager',
    'network-manager-applet',
    'wireshark-qt',
    'openconnect',
    'networkmanager-openconnect',
    'openvpn',
    'gnu-netcat',
    ]
  package { $network_packages : ensure => 'installed' }

  service {'NetworkManager':
    ensure => 'running',
    enable => 'true',
  }

  $ntp_packages = [
    'ntp',
    ]
  package { $ntp_packages : ensure => 'installed' }

  service {'ntpd':
    ensure => 'running',
    enable => 'true',
  }

  $x_packages = [
    'xorg-server',
    'xorg-xinit',
    'xorg-xrandr',
    'xorg-xev',
    'xorg-xprop',
    'rxvt-unicode',
    'arandr',
    'kdiff3',
    'awesome',
    'ttf-dejavu',
    'chromium',
    'slock',
    'xautolock',
    'pidgin',
    'pidgin-sipe',
    'zim',
    'feh',
    'mplayer',
    'oxygen-icons',
  ]
  package { $x_packages : ensure => 'installed' }

  $x_devel_packages = [
    'code',
  ]
  package { $x_devel_packages : ensure => 'installed' }

  $filesystem_packages = [
    'btrfs-progs',
    'nfs-utils',
    'ecryptfs-utils',
    'pam_mount',
    'ntfs-3g',
    'parted',
    'udiskie',
  ]
  package { $filesystem_packages : ensure => 'installed' }

  $other_packages = [
    'os-prober',
    'puppet',
    'numlockx',
    'acpi',
    'debootstrap',
  ]
  package { $other_packages : ensure => 'installed' }

  $monitoring_packages = [
    'i7z',
    'lshw',
  ]
  package { $monitoring_packages : ensure => 'installed' }

  $vmware_dependencies = [
    'linux-headers',
    'linux-lts-headers',
  ]
  package { $vmware_dependencies : ensure => 'installed' }

#  $otherother_packages = [
#    'atom',
#    'ctags',
#    'foxitreader',
#    'libreoffice-still',
#    'stoken',
#    'tinyxml',
#    'weechat',
#    'xf86-video-intel',
#    'redshift', #Remains to try
#  ]
#  package { $otherother_packages : ensure => 'installed' }
}

