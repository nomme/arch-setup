class sudo_configs ($username = 'hogklint') {
  file {"/etc/X11/xorg.conf.d/70-synaptics.conf":
    ensure => present,
    source => "/home/$username/tmp/user-files/70-synaptics.conf",
    owner => "root",
  }
}
