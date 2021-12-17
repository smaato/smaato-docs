var bannerView = GAMBannerView(adSize: kGADAdSizeBanner)
bannerView.adUnitID = "YOUR_GAM_AD_UNIT_ID"
bannerView.rootViewController = self
bannerView.delegate = self
SmaatoSDK.prebidBanner(forAdSpaceId: "SMAATO_ADSPACE_ID",
                         bannerSize: .xxLarge_320x50) {(bid: SMAUbBid?, error: Error?) in
    if let smaatoBid = bid {
        // Let's assume this is the max price of your line items (you will want to change this float to yours)
        let maxPrice : CGFloat = 0.1
        let bidKeyword : String
        
        // Helper to format bidKeyword if the received bid price is greater than max price. In this case, just add smaato_cpm prefix to the maxPrice (formatted value to the required fraction digits).
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
    bannerView.load(kvpRequest)
}
