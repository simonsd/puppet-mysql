class mysql::packages {
	package {
		'mysql-server':
			ensure => installed,
			name => $operatingsystem ? {
				'Centos' => "mysql-server.$hardwaremodel",
				'Debian' => 'mysql-server',
			};

		'mysql-client':
			ensure => installed,
			name => $operatingsystem ? {
				Centos => "mysql.$hardwaremodel",
				Debian => "mysql-client",
			},
			require => Package['mysql-server'];

		'mysql-dev':
			ensure => installed,
			name => $operatingsystem ? {
				Debian => "libmysqlclient15-dev",
				Centos => "mysql-devel.$hardwaremodel",
			},
			require => Package['mysql-server'];
	}
}
