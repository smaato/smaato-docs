guard let adInterstitial = MPInterstitialAdController.init(forAdUnitId: "<MOPUB_ADUNIT>") else {
    return
}
adInterstitial.delegate = self
SmaatoSDK.prebidInterstitial(forAdSpaceId: "<SMAATO_ADSPACE_ID>") { (bid: SMAUbBid?, error: Error?) in
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
       if let adViewKeywords = adInterstitial.keywords {
            var filteredKeywords = adViewKeywords.split(separator: ",").filter { !$0.starts(with: "smaato_cpm") }.map { String($0) }
            filteredKeywords.append(bidKeyword)
            adInterstitial.keywords = filteredKeywords.joined(separator: ",")
       } else {
            adInterstitial.keywords = bidKeyword
       }
 
       // `smaatoBid.metaData` contains unique bid identifier, which is used for creative fetching from cache, if Smaato's bid wins
       if let adLocalExtras = adInterstitial.localExtras {
            adInterstitial.localExtras = adLocalExtras.merging(smaatoBid.metaData) { $1 }
       } else {
            adInterstitial.localExtras = smaatoBid.metaData
       }
   }
   adInterstitial.loadAd()
}
