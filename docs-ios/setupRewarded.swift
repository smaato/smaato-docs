// ViewController.swift
import UIKit
import SmaatoSDKRewardedAds
 
class ViewController: UIViewController {  
    private var rewardedInterstitial: SMARewardedInterstitial?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // you can call this whenever you need the rewarded ad (not just in viewDidLoad())
        callWhenYouNeedRewardedVideo()
    }
 
    func callWhenYouNeedRewardedVideo() {
        // load rewarded ad with desired ad size
        SmaatoSDK.loadRewardedInterstitial(forAdSpaceId: "<SMAATO_ADSPACE_ID_HERE>", delegate: self)
    }
}
 
extension ViewController: SMARewardedInterstitialDelegate {
   
    // Rewarded Video successfully loaded
    func rewardedInterstitialDidLoad(_ rewardedInterstitial: SMARewardedInterstitial) { 
        self.rewardedInterstitial = rewardedInterstitial
        rewardedInterstitial.show(from: self)
    }
     
    // Rewarded Video failed to load   
    func rewardedInterstitialDidFail(_ rewardedInterstitial: SMARewardedInterstitial?, withError error: Error) {       
        print("Rewarded Video failed to load with error: \(error.localizedDescription)")
    }
     
    // Rewarded Video TTL has expired    
    func rewardedInterstitialDidTTLExpire(_ rewardedInterstitial: SMARewardedInterstitial) {
        print("Rewarded Video TTL has expired")
    }
 
    // Rewarded interstitial finishes playing    
    func rewardedInterstitialDidReward(_ rewardedInterstitial: SMARewardedInterstitial) {
        print("Rewarded Video finishes playing")
    }
}