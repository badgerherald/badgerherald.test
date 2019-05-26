exec { 'apt_update':
  command => "apt-get update",
  path => '/usr/bin',
  user => "root",
}

# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin", "~/.composer/vendor/bin/" ] }

class { 'git::install': }
class { 'subversion::install': }
class { 'apache2::install': }
class { 'php7::install': }
class { 'mysql::install': }
class { 'wordpress::install': }
class { 'phpmyadmin::install': }
class { 'exa::install': }
#class { 'composer::install': }
#class { 'phpqa::install': }
#class { 'tests::install': }
#class { 'wpcli::install': }
