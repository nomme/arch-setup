class configs ($username = 'hogklint') {
  file {"/home/$username/.Xdefaults":
    ensure => link,
    target => "/home/$username/tmp/user-files/Xdefaults",
    owner => "$username"
  }
}
