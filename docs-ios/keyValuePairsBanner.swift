// ViewController.swift  
import Foundation
import SmaatoSDKBanner
   
class ViewController: UIViewController {
  // SMABannerView is linked in the Interface Builder with ViewController via IBOutlet.
	@IBOutlet var bannerView: SMABannerView?
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Let's create and set targeting parameters        
        let KVP = SMAKeyValuePairs()
		// replace with your key-value pairs configured within your SPX account
        KVP.setTargetingValue("30", forKey: "Age") 
		// replace with your key-value pairs configured within your SPX account
        KVP.setTargetingValues(["Demo", "Stage"], forKey: "Application")        
        SMABannerView.keyValuePairs = KVP
   
        // Send request, after replacing with your 'AdSpaceID' configured in your SPX account.        
        self.bannerView?.load(withAdSpaceId: "AdSpaceID", adSize: .xxLarge_320x50)
    }
}