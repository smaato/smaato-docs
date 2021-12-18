@property(nonatomic, strong) GAMInterstitialAd *interstitial;
[SmaatoSDK prebidInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID"
                               completion:^(SMAUbBid * _Nullable bid, NSError * _Nullable error) {
    if (bid) {
        // Let's assume this is the max price of your line items (you will want to change this float to yours)
        CGFloat maxPrice = 0.1;
        NSString *bidKeyword;
                                            
        if (bid.bidPrice > maxPrice) {
            bidKeyword = [NSString stringWithFormat:@"smaato_cpm:%.2f", maxPrice];
        } else {
            bidKeyword = bid.mopubPrebidKeyword;
        }
        
        GAMRequest kvpRequest = [GAMRequest request];
        NSDictionary *ubKVP = @{@"smaub":bidKeyword}; // make sure you add "smaub" as a Dynamic Key under Inventory >> Key-Values inside of GAM (no value as you will pass that here)
        kvpRequest.customTargeting = ubKVP;
    }
    [GAMInterstitialAd loadWithAdUnitID:@"YOUR_GAM_AD_UNIT_ID"
                              request:kvpRequest
                    completionHandler:^(GAMInterstitialAd *ad, NSError *error) {
    if (error) {
      NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
      return;
    }
    self.interstitial = ad;
    self.interstitial.fullScreenContentDelegate = self;
}];
