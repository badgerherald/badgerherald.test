# Install phpMyAdmin

class phpmyadmin::install {

  package { 'phpmyadmin':
    ensure => present,
  }

  file { '/etc/apache2/sites-enabled/phpmyadmin.conf':
    ensure  => link,
    target  => '/etc/phpmyadmin/apache.conf',
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

}
