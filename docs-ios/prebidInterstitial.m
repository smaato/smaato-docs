MPInterstitialAdController *adInterstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"MOPUB_ADUNIT_ID"];
adInterstitial.delegate = self;
[SmaatoSDK prebidInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID"
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
        NSString *adViewKeywords = adInterstitial.keywords;
        if (adViewKeywords.length > 0) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF beginswith[c] 'smaato_cpm')"];
            NSMutableArray *filteredKeywords = [[[adViewKeywords componentsSeparatedByString:@","] filteredArrayUsingPredicate:predicate] mutableCopy];
            [filteredKeywords addObject:bidKeyword];
            adInterstitial.keywords = [filteredKeywords componentsJoinedByString:@","];
        } else {
            adInterstitial.keywords = bidKeyword;
        }
 
        if (adInterstitial.localExtras) {
            NSMutableDictionary *extras = [NSMutableDictionary dictionaryWithDictionary:adInterstitial.localExtras];
            [extras addEntriesFromDictionary:bid.metaData];
            adInterstitial.localExtras = extras;
        } else {
            adInterstitial.localExtras = bid.metaData;
        }
    }
    [adInterstitial loadAd];
}];
