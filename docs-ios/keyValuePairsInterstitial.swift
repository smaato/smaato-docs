// ViewController.swift  
import Foundation
import SmaatoSDKInterstitial
   
class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        callWhenYouNeedInterstitial()
    }
   
    func callWhenYouNeedInterstitial() {
        // Let's create and set targeting parameters        
        let KVP = SMAKeyValuePairs()
		// replace with your key-value pairs configured within your SPX account
        KVP.setTargetingValue("30", forKey: "Age")    
		// replace with your key-value pairs configured within your SPX account
        KVP.setTargetingValues(["Demo", "Stage"], forKey: "Application")        
        SMAInterstitial.keyValuePairs = KVP
   
        // Send request, after replacing with your 'AdSpaceID' configured in your SPX account.        
        SmaatoSDK.loadInterstitial(forAdSpaceId: "SMAATO_ADSPACE_ID", delegate: self)
    }
}
