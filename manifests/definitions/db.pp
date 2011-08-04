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
