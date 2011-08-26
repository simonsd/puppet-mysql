class mysql::service {
	service { 'mysqld':
		ensure => running,
		enable => true,
		name => $operatingsystem ? {
			Centos => 'mysqld',
			Debian => 'mysql',
			archlinux => 'mysqld',
		},
		require => Package['mysql-server'];
	}
}
