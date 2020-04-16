// ViewController.swift 
import Foundation
import SmaatoSDKRewardedAds
   
class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        callWhenYouNeedRewardedAds()
    }
   
    func callWhenYouNeedRewardedAds() {
        // Let's create and set targeting parameters        
        let KVP = SMAKeyValuePairs()
		// replace with your key-value pairs configured within your SPX account
        KVP.setTargetingValue("30", forKey: "Age")
		// replace with your key-value pairs configured within your SPX account
        KVP.setTargetingValues(["Demo", "Stage"], forKey: "Application")        
        SMARewardedInterstitial.keyValuePairs = KVP
   
        // Send request, after replacing with your 'AdSpaceID' configured in your SPX account.        
        SmaatoSDK.loadRewardedInterstitial(forAdSpaceId: "AdSpaceID", delegate: self)
    }
}