# == Class: mysql
#
# Installs MySQL server, sets config file, and loads database for dynamic site.
#
class mysql {
  package { ['mysql-server']:
    ensure => present;
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysql'];
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => "mysqladmin -uroot password root",
	user	=> 'root',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }

  exec { 'load-dynamic-sql':
    command => 'mysql < /vagrant/puppet/modules/mysql/files/dbschema.sql',
    path    => ['/bin', '/usr/bin'],
	user	=> 'root',
    require => Exec['set-mysql-password'];
  }
}
