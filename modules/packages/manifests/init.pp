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
    'vim',
    'zsh',
  ]
  package { $base_packages: ensure => 'installed' }

  $devel_packages = [
    'base-devel',
    'the_silver_searcher',
    'tig',
    'strace',
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
    'rxvt-unicode',
    'kdiff3',
    'awesome',
    'ttf-dejavu',
    'chromium',
    'slock',
    'xautolock',
    'pidgin',
    'pidgin-sipe',
  ]
  package { $x_packages : ensure => 'installed' }

  $other_packages = [
    'btrfs-progs',
    'os-prober',
    'puppet',
    'numlockx',
    'udiskie',
    'acpi',
  ]
  package { $other_packages : ensure => 'installed' }
}

