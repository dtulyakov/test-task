#absent_file_exec

#  exec { 'create_needed_directory':
#    command => '/bin/mkdir -p /tmp/needed/directory',
#    creates => '/tmp/needed/directory'
#  }



# Установка и запуск tomcat6
#class tomcat6 {
  package { 'tomcat6':
    ensure => 'installed',
  }
  service { tomcat6:
    enable => true,
    ensure => running,
  }
#}

# Установка и запуск Nginx
#class nginx {
  package { 'nginx':
    ensure => 'installed',
  }
  service { nginx:
    enable => true,
    ensure => running,
  }
#}

