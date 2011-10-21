import 'classes/*'
import 'definitions/*'

class mysql (
	$rootpass
	$stages = 'no'
) {
	if $stages == 'no' {
		class{'packages':} -> class{'service':} -> class{'config':}
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
