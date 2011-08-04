define mysql_db (
	$name,
	$pass = "$mysql::rootpass",
	$user = 'root',
	$host = 'localhost'
){
	exec {
		'add_db':
			command => "mysqladmin -u\"$user\" -p\"$pass\" -h \"$host\" create \"$name\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -u\"$user\" -p\"$pass\" -h \"$host\" -e 'show databases'|grep \"$name\"",
	}
}

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