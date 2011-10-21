import 'classes/*'
import 'definitions/*'

class mysql (
	$rootpass,
	$stages = 'no'
) {
	if $stages == 'no' {
		class{
			'mysql::packages':
				before => Class['mysql::service'];
			'mysql::service':
				before => Class['mysql::config'];
			'mysql::config':;
		}
	} else {
		class{
			'packages':
				stage => depends;
			'service':
				stage => config;
			'config':
				stage => services;
		}
	}
}
