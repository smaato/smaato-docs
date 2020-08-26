MPRewardedVideo.setDelegate(self, forAdUnitId: "<MOPUB_ADUNIT_ID>")
SmaatoSDK.prebidRewardedInterstitial(forAdSpaceId: "<SMAATO_ADSPACE_ID>") { (bid: SMAUbBid?, error: Error?) in
    var keyword: String? = "<SOME-OTHER-BID-KEYWORDS>"
    var bidExtra: [AnyHashable:Any]? = ["<SOME-OTHER-KEY>" : "<SOME-OTHER-VAKUE>"]
    if let smaatoBid = bid {
        // Let's assume this is the max price
        let maxPrice : CGFloat = 0.1
        let bidKeyword : String            
        if smaatoBid.bidPrice > maxPrice {
            bidKeyword = String(format: "smaato_cpm:%.2f", maxPrice)
        } else {
            bidKeyword = smaatoBid.mopubPrebidKeyword
        }
        // or manual something like `let bidKeyword = "smaato" + "-" + "\(smaatoBid.bidPrice * 100)"`
        keywords = (keywords != nil) ? keywords + ",\(bidKeyword)" : bidKeyword
        bidExtra = (bidExtra != nil) ? bidExtra.merging(smaatoBid.metaData) { $1 } : smaatoBid.metaData
   }
   MPRewardedVideo.loadAd(withAdUnitID: "<MOPUB_ADUNIT_ID>", keywords: keywords, userDataKeywords: nil, location: nil, customerId: nil, mediationSettings: [], localExtras: bidExtra)
}
