# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  host { 'hostmachine':
    ip => '192.168.56.101';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
  file { "/etc/apt/sources.list":
    ensure => file,
    owner => root,
    group => root,
    mode => 0644,
    source => "puppet:///modules/baseconfig/sources.list",
  }
  file { "/etc/apt/sources.list.d/dotdeb.list":
    ensure => file,
    owner => root,
    group => root,
    mode => 0644,
    source => "puppet:///modules/baseconfig/dotdeb.list",
  }
  exec { "import-gpg-dotdeb":
    command		=> "/usr/bin/wget -q http://www.dotdeb.org/dotdeb.gpg -O -| /usr/bin/apt-key add -",
	user		=> 'root';
  }  
  exec { "import-gpg-mysql":
    command		=> "/usr/bin/apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5",
	user		=> 'root';
  }    
  exec { 'apt-update':
    command => '/usr/bin/apt-get update',
    require => [File["/etc/apt/sources.list.d/dotdeb.list", "/etc/apt/sources.list"], Exec["import-gpg-dotdeb", "import-gpg-mysql"]]
  }

  package { ['mc',
             'phpunit',
			 'ntp',
			 'imagemagick']:
    ensure => present,
	require => Exec['apt-update'];
  }  
  exec { 'phpunit-upgrade-via-pear':
    command => 'sudo pear config-set auto_discover 1 && sudo pear install pear.phpunit.de/PHPUnit',
	path		=> '/usr/local/bin::/usr/bin:/bin:/usr/sbin/',
	user		=> 'root',
	onlyif		=> 'sudo pear install pear.phpunit.de/PHPUnit',
	logoutput => on_failure;
  }
  
}
