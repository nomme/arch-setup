node default {
    class {'post_configs':
        username => 'jimmieh',
#        ihu_manifest => '<manifest name>',
#        sem_manifest => '<manifest name>',
    }
    class {'aur_packages': username => 'jimmieh', }
}

