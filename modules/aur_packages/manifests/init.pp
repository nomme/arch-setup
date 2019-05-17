class aur_packages ($username = 'hogklint') {
  file {"/home/$username/tmp":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/tmp/aur":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/tmp/aur/auracle-git.tar.gz":
    ensure => 'present',
    source => 'https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz',
    replace => 'false',
    owner => "$username",
  }

  exec {"unpack auracle":
    unless => '/bin/test -f /home/$username/tmp/aur/auracle-git',
    command => '/usr/bin/tar -xf auracle-git.tar.gz',
    cwd => "/home/$username/tmp/aur",
    user => "$username",
  }

# Does not handle allocating tty for sudo pw
#  exec {"install auracle":
#    command => '/usr/bin/makepkg --syncdeps --install --noconfirm',
#    cwd => "/home/$username/tmp/aur/auracle-git",
#  }
}

