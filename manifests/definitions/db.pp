define mysql_db (
	$user = 'root',
	$host = 'localhost',
	$rootpass = "${mysql::rootpass}",
	$perms = 'all privileges'
){
	exec {
		"create_db_$name":
			command => "mysqladmin -uroot -p$rootpass -h \"$host\" create \"$name\"",
			path => '/usr/bin:/bin:/sbin',
			unless => "mysql -uroot -p$rootpass -h \"$host\" -e 'use $name'";

		"set_perms_$name":
			command => "mysql -uroot -p$rootpass -h $host -e \"grant $perms on $name.* to '$user'@'$host'\"",
			path => '/usr/bin:/bin:/sbin',
#			unless => "mysql -uroot -p$rootpass -h $host -e \"select * from information_schema.user_privileges\"|grep $mysql::dbname";
	}
}
