define mysql_user (
	$pass = 'StdPas5',
	$rootpass = "${mysql::rootpass}",
	$host = 'localhost'
){
	exec {
		"add_mysql_user_${name}":
			command => "mysql -uroot -p$rootpass -h \"$host\" -e \"create user '$name'@'$host' identified by '$pass'\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -uroot -p$rootpass -h$host -e \"use mysql;select user,host from user;\"|grep $host|grep $name"
	}
}
