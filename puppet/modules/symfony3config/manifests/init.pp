# == Class: apache_vhosts
#
# Adds and enables virtual hosts. Sets up /var/www symlinks.
#
class symfony3config {
  file {
    "/usr/lib/symfony3/":
	  ensure => directory,
	  mode => 0777;
    "/usr/lib/symfony3/vendor":
	  ensure => directory,
	  mode => 0777;
    "/usr/lib/symfony3/cache":
	  ensure => directory,
	  mode => 0777;
    "/usr/lib/symfony3/logs":
	  ensure => directory,
	  mode => 0777;
  }
  file { "/usr/local/bin/composer":
    ensure => file,
    owner => root,
    group => root,
    mode => 0777,
    source => "puppet:///modules/symfony3config/composer",
  }
  exec { 'composer-self-upgrade':
    command => 'sudo composer self-update',
	path		=> '/usr/local/bin::/usr/bin:/bin:/usr/sbin/',
	user		=> 'root',
    require => [File["/usr/local/bin/composer"]]
  }  
  exec { 'composer-install-symfony3-vendor':
    command => 'sudo composer install -d /var/www/application',
	path		=> '/usr/local/bin::/usr/bin:/bin:/usr/sbin/',
	user		=> 'root',
    require => [File["/usr/local/bin/composer"],Exec['composer-self-upgrade']]
  }  
  exec { 'symfony3-vendor-set-permissions-after-composer-install':
    command => 'sudo chmod 777 /usr/lib/symfony3/* -R',
	path		=> '/usr/local/bin::/usr/bin:/bin:/usr/sbin/',
	user		=> 'root',
    require => Exec['composer-install-symfony3-vendor'];
  }  
  
}
