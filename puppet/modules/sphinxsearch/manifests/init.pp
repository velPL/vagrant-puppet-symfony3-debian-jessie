# == Class: sphinxsearch
#
# Installs Sphinx Search, sets config file
#
class sphinxsearch {
  package { ['sphinxsearch']:
    ensure => present;
  }
  file { '/etc/cron.d/sphinxsearch':
    source  => 'puppet:///modules/sphinxsearch/cron',
    require => Package['sphinxsearch'],
    notify  => Service['sphinxsearch'];
  }
  file { '/etc/default/sphinxsearch':
    source  => 'puppet:///modules/sphinxsearch/sphinxsearch',
    require => Package['sphinxsearch'],
    notify  => Service['sphinxsearch'];
  }
  file { '/etc/sphinxsearch/sphinx.conf':
    source  => 'puppet:///modules/sphinxsearch/sphinx.conf',
    require => Package['sphinxsearch'],
    notify  => Service['sphinxsearch'];
  }
  exec { 'indexer':
	command		=> 'sudo /usr/bin/indexer --all --quiet --rotate',
    require => [Package['sphinxsearch'], File['/etc/cron.d/sphinxsearch', '/etc/default/sphinxsearch', '/etc/sphinxsearch/sphinx.conf']],
	path		=> '/usr/local/bin::/usr/bin:/bin',
	user		=> 'root';
  }
  service { 'sphinxsearch':
    ensure 		=> running,
    require		=> [Package['sphinxsearch'], File['/etc/cron.d/sphinxsearch', '/etc/default/sphinxsearch', '/etc/sphinxsearch/sphinx.conf'], Exec['indexer']],
    enable		=> true,
    hasrestart	=> true,
    hasstatus	=> true;
  }  
}
