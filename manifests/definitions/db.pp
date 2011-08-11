define mysql_db (
	$pass = "$mysql::rootpass",
	$user = 'root',
	$host = 'localhost',
	$perms = 'all privileges'
){
	exec {
		'add_db':
			command => "mysqladmin -uroot -p$mysql::rootpass -h \"$host\" create \"$name\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -uroot -p$mysql::rootpass -h \"$host\" -e 'use $name'";

		'set perms':
			command => "mysql -uroot -p$mysql::rootpass -h $host -e \"grant $perms on $name.* to '$user'@'$host' identified by '$pass'\"",
			path => '/usr/bin:/bin:/sbin',
#			unless => "mysql -uroot -p$mysql::rootpass -h $host -e \"
	}
}
