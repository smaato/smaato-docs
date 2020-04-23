// AppDelegate.swift
import UIKit
import SmaatoSDKCore
 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
     
    var window: UIWindow?
     
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // initialize SDK!        
        guard let config = SMAConfiguration(publisherId: "SMAATO_PUBLISHER_ID") else {
              fatalError("SDK config is nil!")
        }
		// allow HTTPS traffic only
        config.httpsOnly = true 
		// log errors only
        config.logLevel = .error
		// ads content restriction based on age
		config.maxAdContentRating = .undefined
         
        SmaatoSDK.initSDK(withConfig:config)
		// allow the Smaato SDK to automatically get the user's location and put it inside the ad request
        SmaatoSDK.gpsEnabled = true  
 
        // optional, specific configuration        
        SmaatoSDK.userGender = .male // usually set after user logs in
        SmaatoSDK.userAge = 40 // usually set after user logs in
        SmaatoSDK.userSearchQuery = "bitcoin, lamborghini, san+francisco"
         
        return true
    }
}
