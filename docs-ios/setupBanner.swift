// ViewController.swift
import UIKit
import SmaatoSDKBanner
 
class ViewController: UIViewController { 
	// get the Smaato banner view from the interface
    @IBOutlet weak var bannerView: SMABannerView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
     		 // (optional) set the desired auto-reload time interval
    	   bannerView.autoreloadInterval = .veryShort 
		      // (required) set the delegate
    	   bannerView.delegate = self
		      // load the banner, with desired size
    	   bannerView.load(withAdSpaceId: "<SMAATO_ADSPACE_ID_HERE>", adSize: .xxLarge_320x50)
    }
}
 
extension ViewController: SMABannerViewDelegate {
   // return presenting view controller to display Ad contents modally, e.g. in internal WebBrowser
   func presentingViewController(for bannerView: SMABannerView) -> UIViewController {
        return self
   }
 
   // notification callback: ads TTL has expired
   func bannerViewDidTTLExpire(_ bannerView: SMABannerView) {
        print("Banner TTL has expired. You should load new one")
   }
}