class mysql::packages {
	package {
		'mysql-server':
			ensure => installed,
			name => 'mysql-server';

		'mysql-client':
			ensure => installed,
			name => $operatingsystem ? {
				Debian => 'mysql-client',
				Centos => 'mysql',
			},
			require => Package['mysql-server'];

		'mysql-dev':
			ensure => installed,
			name => $operatingsystem ? {
				Debian => 'libmysqlclient15-dev',
				Centos => 'mysql-devel',
			},
			require => Package['mysql-server'];
	}
}
