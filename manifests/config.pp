class mysql_config {
	exec { 'setup_mysql_pass_root':
		command => "/usr/bin/mysqladmin -uroot -h localhost password $mysql_rootpass",
		unless => '/usr/bin/mysql -uroot -h localhost',
		require => Class['mysql_packages'],
	}

	define mysql_db (
		$NAME='mysql',
		$PASS='NoSQLtoday',
		$USER='root'
	) {
		exec {
			'add_db':
				command => "mysqladmin -uroot -h $HOST password $PASS",
		}
	}
}
