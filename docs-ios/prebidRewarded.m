@property(nonatomic, strong) GADRewardedAd *rewardedAd;
[SmaatoSDK prebidRewardedInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID"
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
        NSDictionary *ubKVP = @{@"smaub":bidKeyword};
        kvpRequest.customTargeting = ubKVP;
    }
     [GADRewardedAd
       loadWithAdUnitID:@"YOUR_GAM_AD_UNIT_ID"
                request:kvpRequest
      completionHandler:^(GADRewardedAd *ad, NSError *error) {
        if (error) {
          NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
          return;
        }
        self.rewardedAd = ad;
        NSLog(@"Rewarded ad loaded.");
      }];
];
