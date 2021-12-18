var rewardedAd: GADRewardedAd?
SmaatoSDK.prebidRewardedInterstitial(forAdSpaceId: "SMAATO_ADSPACE_ID") { (bid: SMAUbBid?, error: Error?) in

    if let smaatoBid = bid {
        // Let's assume this is the max price of your line items (you will want to change this float to yours)
        let maxPrice : CGFloat = 0.1
        let bidKeyword : String            
        if smaatoBid.bidPrice > maxPrice {
            bidKeyword = String(format: "smaato_cpm:%.2f", maxPrice)
        } else {
            bidKeyword = smaatoBid.mopubPrebidKeyword
        }
        let kvpRequest = GAMRequest()
        let ubKVP = [
            "smaub": bidKeyword // make sure you add "smaub" as a Dynamic Key under Inventory >> Key-Values inside of GAM (no value as you will pass that here)
        ]
        kvpRequest.customTargeting = ubKVP
   }
   GADRewardedAd.load(withAdUnitID:"YOUR_GAM_AD_UNIT_ID",
                                request: kvpRequest,
                      completionHandler: { [self] ad, error in
                        if let error = error {
                          print("Failed to load rewarded ad with error: \(error.localizedDescription)")
                          return
                        }
                        rewardedAd = ad
                        rewardedAd?.fullScreenContentDelegate = self
                      }
    )
}
