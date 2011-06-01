class mysql::packages {
	package { 'mysql-server':
		ensure => installed,
		name => $operatingsystem ? {
			Debian => 'mysql-server',
			Centos => 'mysql-server',
		},
	}

	service { 'mysqld':
		ensure => running,
		enable => true,
		name => $operatingsystem ? {
			Centos => 'mysqld',
			Debian => 'mysql',
		},
		require => Package['mysql-server'],
	}

	package { 'mysql-client':
		ensure => installed,
		name => $operatingsystem ? {
			Debian => 'mysql-client',
			Centos => 'mysql',
		},
		require => Package['mysql-server'],
	}

	package { 'mysql-dev':
		ensure => installed,
		name => $operatingsystem ? {
			Debian => 'libmysqlclient15-dev',
			Centos => 'mysql-devel',
		},
		require => Package['mysql-server'],
	}
}

class mysql_config {
	exec { 'setup_mysql_pass_root':
		command => '/usr/bin/mysqladmin -uroot -h localhost password "penguins"',
		unless => '/usr/bin/mysql -uroot -h localhost',
		require => Class['mysql_packages'],
	}
}
