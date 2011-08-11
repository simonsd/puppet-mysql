define mysql_user (
	$pass = 'StdPas5',
	$newpass = "",
	$host = 'localhost'
){
	exec {
		'add_user':
			command => "mysql -uroot -p$mysql::rootpass -h \"$host\" -e \"create user '$name'@'$host' identified by '$pass'\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -uroot -p$mysql::rootpass -h$host -e \"use mysql;select user,host from user;\"|grep $host|grep $name"
	}
}
