class repo ($username = 'hogklint'){
  vcsrepo {"/home/$username/tmp/vim-env":
    ensure => present,
    provider => git,
    source => 'https://github.com/nomme/vim-env.git',
    user => "$username",
  }

  vcsrepo {"/home/$username/tmp/user-files":
    ensure => present,
    provider => git,
    source => 'https://github.com/nomme/user-files.git',
    user => "$username",
  }

  vcsrepo {"/home/$username/tmp/arch-setup":
    ensure => present,
    provider => git,
    source => 'https://github.com/nomme/arch-setup.git',
    user => "$username",
  }
}
