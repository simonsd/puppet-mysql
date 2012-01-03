define mysql_db (
	$user = 'root',
	$host = 'localhost',
	$server = 'localhost',
	$rootpass = "${mysql::rootpass}",
	$perms = 'all privileges'
){
	exec {
		"create_db_$name":
			command => "mysqladmin -uroot -p$rootpass -h \"$server\" create \"$name\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -uroot -p$rootpass -h \"$server\" -e 'use $name'";

		"set_perms_$name":
			command => "mysql -uroot -p$rootpass -h $server -e \"grant $perms on $name.* to '$user'@'$host'\"",
			path => '/usr/bin:/bin:/sbin',
#			unless => "mysql -uroot -p$rootpass -h $server -e \"select * from information_schema.user_privileges\"|grep $mysql::dbname";
	}
}
