class mysql_config {
	exec { 'setup_mysql_pass_root':
		command => '/usr/bin/mysqladmin -uroot -h localhost password "penguins"',
		unless => '/usr/bin/mysql -uroot -h localhost',
		require => Class['mysql_packages'],
	}
}
