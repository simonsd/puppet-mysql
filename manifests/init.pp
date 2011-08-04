import 'classes/*'
import 'definitions/*'

class mysql (
	$rootpass
) {
	class{'packages':} -> class{'service':} -> class{'config':}
}
