class packages {
  $base_packages = [
    'bind-tools',
    'curl',
    'git',
    'htop',
    'glances',
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
    'picocom',
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
  ]
  package { $x_packages : ensure => 'installed' }

  $filesystem_packages = [
    'btrfs-progs',
    'nfs-utils',
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
    'xf86-input-synaptics',
    'debootstrap',
  ]
  package { $other_packages : ensure => 'installed' }

  $monitoring_packages = [
    'i7z',
    'lshw',
  ]
  package { $monitoring_packages : ensure => 'installed' }

#  $otherother_packages = [
#    'atom',
#    'ctags',
#    'foxitreader',
#    'libreoffice-still',
#    'stoken',
#    'tinyxml',
#    'weechat',
#  ]
#  package { $otherother_packages : ensure => 'installed' }
}

