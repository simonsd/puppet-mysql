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
