define mysql_user (
	$name,
	$pass = 'StdPas5',
	$newpass = "",
#	$rootpass = "$mysql_rootpass",
	$host = 'localhost'
){
	exec {
		'add_user':
			command => "mysql -uroot -p$mysql::rootpass -h \"$host\" -e \"create user '$name'@'$host' identified by '$pass'\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -u$name -p$pass -h $host";
	}
}
