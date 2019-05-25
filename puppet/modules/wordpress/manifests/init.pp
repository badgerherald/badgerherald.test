# Install latest Wordpress

class wordpress::install {

  $dbname = 'badgerherald.test'

  # Create the Wordpress database
  exec { 'create-database':
    unless  => 'sudo /usr/bin/mysql -uroot badgerheraldtest',
    command => 'sudo /usr/bin/mysql -uroot --execute=\'create database `badgerheraldtest`\'',
    user => 'root'
  }

  exec { 'create-user':
    unless  => 'sudo /usr/bin/mysql -u wordpress -pwordpress `badgerheraldtest`',
    command => 'sudo /usr/bin/mysql -uroot --execute="GRANT ALL PRIVILEGES ON badgerheraldtest.* TO \'wordpress\'@\'localhost\' IDENTIFIED BY \'wordpress\'"',
    user => 'root'
  }

  exec { 'download-wordpress':
    command => '/usr/bin/wget http://wordpress.org/latest.tar.gz',
    cwd     => '/vagrant/badgerherald.test',
    creates => '/vagrant/badgerherald.test/latest.tar.gz'
  }

  exec { 'untar-wordpress':
    cwd     => '/vagrant/badgerherald.test',
    command => '/bin/tar xzvf /vagrant/badgerherald.test/latest.tar.gz',
    require => Exec['download-wordpress'],
    creates => '/vagrant/badgerherald.test/wordpress',
  }

  # Import a MySQL database for a basic wordpress site.
  file { '/tmp/badgerherald.test-db.sql':
    source => 'puppet:///modules/wordpress/badgerherald.test-db.sql'
  }

  exec { 'load-db':
    command => '/usr/bin/mysql -u wordpress -pwordpress badgerheraldtest < /tmp/badgerherald.test-db.sql && touch /home/vagrant/db-created',
    creates => '/home/vagrant/db-created',
  }

  # Copy a working wp-config.php file for the vagrant setup.
  file { '/vagrant/badgerherald.test/wordpress/wp-config.php':
    source => 'puppet:///modules/wordpress/wp-config.php'
  }

}
