// ViewController.swift
import UIKit
import SmaatoSDKInterstitial
 
class ViewController: UIViewController { 
    private var interstitial: SMAInterstitial?
 
    override func viewDidLoad() {
         super.viewDidLoad()
         // you can call this whenever you need the interstitial (not just in viewDidLoad())
         callWhenYouNeedInterstitial()
    }
 
    func callWhenYouNeedInterstitial() {
         // load interstitial ad with desired ad size
         SmaatoSDK.loadInterstitial(forAdSpaceId: "<SMAATO_ADSPACE_ID_HERE>", delegate: self)
    }
}
 
extension ViewController: SMAInterstitialDelegate {
    // Interstitial successfully loaded
    func interstitialDidLoad(_ interstitialResponse: SMAInterstitial) {
        interstitial = interstitialResponse
        interstitialResponse.show(from: self)
    }
     
    // Interstitial failed to load
    func interstitial(_ interstitial: SMAInterstitial?, didFailWithError error: Error) {
       print("Interstitial did fail loading with error: \(error.localizedDescription)")
    }
     
    // Interstitial ads TTL has expired    
    func interstitialDidTTLExpire(_ interstitial: SMAInterstitial) {
        print("Interstitial TTL has expired")
    }
}