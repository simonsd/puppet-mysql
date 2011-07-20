import 'packages.pp'
import 'service.pp'
import 'config.pp'
import 'define.pp'

class mysql {
	include mysql::packages
	include mysql::service
	include mysql::config

	Class['mysql::packages'] -> Class['mysql::service'] -> Class['mysql::config']
}
