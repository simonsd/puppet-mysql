class mysql::packages {
	package {
		'mysql-server':
			ensure => installed,
			name => "mysql-server.$hardwaremodel";

		'mysql-client':
			ensure => installed,
			name => $operatingsystem ? {
				Debian => "mysql-client.$hardwaremodel",
				Centos => "mysql.$hardwaremodel",
			},
			require => Package['mysql-server'];

		'mysql-dev':
			ensure => installed,
			name => $operatingsystem ? {
				Debian => "libmysqlclient15-dev.$hardwaremodel",
				Centos => "mysql-devel.$hardwaremodel",
			},
			require => Package['mysql-server'];
	}
}
