MPAdView *adView = [[MPAdView alloc] initWithAdUnitId:@"<MOPUB_ADUNIT_ID>" size:MOPUB_BANNER_SIZE];
adView.delegate = self;
[SmaatoSDK prebidBannerForAdSpaceId:@"<SMAATO_ADSPACE_ID>"
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
                
        NSString *adViewKeywords = adView.keywords;
        adViewKeywords = adViewKeywords ? [NSString stringWithFormat:@"%@,%@", adViewKeywords, bidKeyword] : bidKeyword;
        adView.keywords = adViewKeywords;
        if (self.adView.localExtras) {
            NSMutableDictionary *extras = [NSMutableDictionary dictionaryWithDictionary:self.adView.localExtras];
            [extras addEntriesFromDictionary:bid.metaData];
            self.adView.localExtras = extras;
        } else {
            self.adView.localExtras = bid.metaData;
        }
    }
    [adView loadAd];  
}];
