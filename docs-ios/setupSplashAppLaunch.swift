// AppDelegate.swift
import UIKit
import SmaatoSDKInterstitial
 
class AppDelegate: UIResponder, UIApplicationDelegate { 
    private var interstitial: SMAInterstitial?
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         super.viewDidLoad()
         let params = SMAAdRequestParams()
         params.isSplash = true
         SmaatoSDK.loadInterstitial(forAdSpaceId: "SMAATO_ADSPACE_ID", delegate: self, requestParams: params)
    }
}
 
extension AppDelegate: SMAInterstitialDelegate {
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
