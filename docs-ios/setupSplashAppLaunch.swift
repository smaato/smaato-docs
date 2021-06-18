// AppDelegate.swift
import UIKit
import SmaatoSDKInterstitial
 
class AppDelegate: UIResponder, UIApplicationDelegate { 
    private var interstitial: SMAInterstitial?
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         let params = SMAAdRequestParams()
         params.isSplash = true
         SmaatoSDK.loadInterstitial(forAdSpaceId: "SMAATO_ADSPACE_ID", delegate: self, requestParams: params)
    }
}
