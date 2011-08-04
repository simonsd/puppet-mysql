import 'packages.pp'
import 'service.pp'
import 'config.pp'
import 'define.pp'

class mysql (
	$rootpass
) {
	class{'packages':} -> class{'service':} -> class{'config':}
}
