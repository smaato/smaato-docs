// ViewController.swift
import UIKit
import SmaatoSDKOutstream
 
class ViewController: UIViewController { 
	// get the Smaato outstream view from the interface
    @IBOutlet weak var outstreamView: SMAOutstreamView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
		      // (required) set the delegate
    	   outstreamView.delegate = self
		      // load the outstream view, with desired size
    	   outstreamView.load(withAdSpaceId: "SMAATO_ADSPACE_ID", 
                     outstreamAdSize: .rectangle_300x300)
    }
}
 
extension ViewController: SMABannerViewDelegate {
   // return presenting view controller to display Ad contents modally, e.g. in internal WebBrowser
   func presentingViewController(for bannerView: SMABannerView) -> UIViewController {
        return self
   }
   
   // check if outstream ad loaded successfully
   func bannerViewDidLoad(_ bannerView: SMABannerView) {
        print("Outstream ad has loaded successfully!")
   }
    
   // check if outstream ad failed to load
   func bannerView(_ bannerView: SMABannerView, didFailWithError error: Error) {
        print("Outstream ad failed to load with error: \(error.localizedDescription)")
   }
 
   // notification callback: ads TTL has expired
   func bannerViewDidTTLExpire(_ bannerView: SMABannerView) {
        print("Outstream ad TTL has expired. You should load new one")
   }
}
