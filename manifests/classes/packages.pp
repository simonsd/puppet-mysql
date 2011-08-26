class mysql::packages {
	@package {
		'mysql-server':
			ensure => installed,
			name => $::operatingsystem ? {
				archlinux => 'mysql',
				'Centos' => "mysql-server.$::hardwaremodel",
				'Debian' => 'mysql-server',
			};

		'mysql-client':
			ensure => installed,
			name => $::operatingsystem ? {
				archlinux => 'mysql-clients',
				Centos => "mysql.$::hardwaremodel",
				Debian => "mysql-client",
			},
			require => Package['mysql-server'];

		'mysql-dev':
			ensure => installed,
			name => $::operatingsystem ? {
				Debian => "libmysqlclient15-dev",
				Centos => "mysql-devel.$::hardwaremodel",
			},
			require => Package['mysql-server'];
	}

	realize(Package['mysql-server', 'mysql-client'])
	if $::operatingsystem != 'archlinux' {
		realize(Package['mysql-dev'])
}
