class mysql::install {

  $password = 'root'

  package { [
      'mysql-client',
      'mysql-server',
    ]:
    ensure => installed,
}

  service { 
        "mysql":
            enable => true,
            ensure => running,
            require => Package["mysql-server"],
  }

  exec { 'Set MySQL server\'s root password':
    subscribe   => [
      Package['mysql-server'],
      Package['mysql-client'],
    ],
    refreshonly => true,
    unless      => "mysqladmin -uroot -p${password} status",
    command     => "mysqladmin -uroot password ${password}",
  }

}
