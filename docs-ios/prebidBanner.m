GAMBannerView *bannerView = [[GAMBannerView alloc] initWithAdSize:kGADAdSizeBanner];
bannerView.adUnitID = @"YOUR_GAM_AD_UNIT_ID";
bannerView.rootViewController = self;
bannerView.delegate = self;
[SmaatoSDK prebidBannerForAdSpaceId:@"SMAATO_ADSPACE_ID"
                         bannerSize:kSMAUbBannerSizeXXLarge_320x50
                         completion:^(SMAUbBid * _Nullable bid, NSError * _Nullable error) {
    if (bid) {
        // Let's assume this is the max price
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
    [self.bannerView loadRequest: kvpRequest]; 
}];
