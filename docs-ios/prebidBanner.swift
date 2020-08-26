guard let adView = MPAdView(adUnitId: "a27e026a62d54d5ba59486ef6d63406c", size: MOPUB_BANNER_SIZE) else {
    return
}
adView.delegate = self
SmaatoSDK.prebidBanner(forAdSpaceId: "<SMAATO_ADSPACE_ID>",
                         bannerSize: .xxLarge_320x50) {(bid: SMAUbBid?, error: Error?) in
    if let smaatoBid = bid {
        // Let's assume this is the max price
        let maxPrice : CGFloat = 0.1
        let bidKeyword : String
        
        // Helper to format bidKeyword if the received bid price is greater than max price. In this case, just add smaato_cpm prefix to the maxPrice (formatted value to the required fraction digits).
        if smaatoBid.bidPrice > maxPrice {
            bidKeyword = String(format: "smaato_cpm:%.2f", maxPrice)
        } else {
            bidKeyword = smaatoBid.mopubPrebidKeyword
        }
        // or manual something like `let bidKeyword = "smaato" + "-" + "\(smaatoBid.bidPrice * 100)"`
        if let adViewKeywords = adView.keywords {                                       
            adView.keywords = adViewKeywords + ",\(bidKeyword)"
        } else {
            adView.keywords = bidKeyword
        }
        // `smaatoBid.metaData` contains unique bid identifier, which is used for creative fetching from cache, if Smaato's bid wins
        if let adLocalExtras = adView.localExtras {
            adView.localExtras = adLocalExtras.merging(smaatoBid.metaData) { $1 }
        } else {
            adView.localExtras = smaatoBid.metaData
        }
    }
    adView.loadAd()
}
