#class repo ($username = 'hogklint'){
#  vcsrepo {"/home/$username/tmp/vim-env":
#    ensure => present,
#    provider => git,
#    source => 'https://github.com/nomme/vim-env.git',
#    user => "$username",
#  }
#}

node default {
#include repo
class {'sudo_configs': username => 'hogklint', }
#class {'repo': }
}

