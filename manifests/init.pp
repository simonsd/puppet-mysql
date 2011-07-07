import 'packages.pp'
import 'service.pp'
import 'config.pp'

class mysql {
	include mysql::packages
	include mysql::service
	include mysql::config
}
