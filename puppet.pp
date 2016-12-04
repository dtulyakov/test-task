# Установка и запуск tomcat6
  package { 'tomcat6':
    ensure => 'installed',
  }
  service { tomcat6:
    enable => true,
    ensure => running,
  }

# Установка и запуск Nginx
  package { 'nginx':
    ensure => 'installed',
  }
  service { nginx:
    enable => true,
    ensure => running,
  }

