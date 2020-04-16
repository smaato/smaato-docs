// AppDelegate.swift
import UIKit
import SmaatoSDKCore
  
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {  
    var window: UIWindow?
      
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let sdkConfig = MPMoPubConfiguration(adUnitIdForAppInitialization: "<AD_UNIT_ID>")
        sdkConfig.globalMediationSettings = []
        sdkConfig.loggingLevel = .info
        sdkConfig.allowLegitimateInterest = true
        sdkConfig.additionalNetworks = SMAMoPubBaseAdapterConfiguration()
        
        var smaatoConfig: [AnyHashable : Any] = [:]
        smaatoConfig.setObject("Publisher_ID", forKey: "publisherId")
        smaatoConfig.setObject(true, forKey: "httpsOnly")
        smaatoConfig.setObject(false, forKey: "loggingDisabled")
        smaatoConfig.setObject(kSMALogLevelError, forKey: "logLevel")
        smaatoConfig.setObject(kSMAMaxAdContentRatingUndefined, forKey: "maxAdContentRating")
        
        sdkConfig.mediatedNetworkConfigurations = [
        "SMAMoPubBaseAdapterConfiguration": smaatoConfig
        ]
        
        MoPub.sharedInstance().initializeSdk(with: sdkConfig) {
            print("SDK initialization complete.")
            SmaatoSDK.gpsEnabled = true
            SmaatoSDK.userGender = kSMAGenderFemale
            SmaatoSDK.userAge = 30
            SmaatoSDK.userSearchQuery = "yoga, vegan, san+francisco"
        }
         
        return true
    }
}