class post_configs ($username = 'hogklint',
        $ihu_manifest = '',
        $sem_manifest = '') {
  file {"/home/common/mirrors":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  file {"/home/common/mirrors/ihu":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  file {"/home/common/mirrors/sem":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  file {"/home/common/mirrors/ihu/.repo":
    ensure => 'absent',
    force => true,
  }

  file {"/home/common/mirrors/sem/.repo":
    ensure => 'absent',
    force => true,
  }

  exec {'init_ihu_mirror':
      command => "repo init --mirror -u ssh://gerrit/Android_bsd_manifest -b devel -m $ihu_manifest",
      cwd => "/home/common/mirrors/ihu",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  exec {'init_sem_mirror':
      command => "repo init --mirror -u ssh://gerrit/vgtt_p2952_manifests -b master -m $sem_manifest --reference /home/common/mirrors/ihu",
      cwd => "/home/common/mirrors/sem",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  cron {'sync_mirrors':
      ensure => 'present',
      command => "/home/$username/local/bin/update_aosp_mirrors.sh",
      user => "$username",
      minute => 0,
  }

  exec {'init_ihu':
      command => "repo init -u ssh://gerrit/Android_bsd_manifest -b master -m $ihu_manifest --reference /home/common/mirrors/ihu",
      cwd => "/home/$username/sem/aosp_local",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  exec {'init_sem':
      command => "repo init -u ssh://gerrit/vgtt_p2952_manifests -b master -m $sem_manifest --reference /home/common/mirrors/sem",
      cwd => "/home/$username/sem/aosp_local",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }
}
