class mysql::service {
	service { 'mysqld':
		ensure => running,
		enable => true,
		name => $operatingsystem ? {
			Centos => 'mysqld',
			Debian => 'mysql',
		},
		require => Package['mysql-server'],
	}
}
