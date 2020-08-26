[MPRewardedVideo setDelegate:self forAdUnitId:@"MOPUB_ADUNIT_ID"];
[SmaatoSDK prebidRewardedInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID"
                                       completion:^(SMAUbBid * _Nullable bid, NSError * _Nullable error) {
    NSString *keywords = @"SOME-OTHER-BID-KEYWORDS"; // could be nil
    NSDictionary *bidExtra = @{@"SOME-OTHER-KEY" : @"SOME-OTHER-VALUE"}; // could be nil
    if (bid) {
        // Let's assume this is the max price
        CGFloat maxPrice = 0.1;
        NSString *bidKeyword;                                          
        if (bid.bidPrice > maxPrice) {
            bidKeyword = [NSString stringWithFormat:@"smaato_cpm:%.2f", maxPrice];
        } else {
            bidKeyword = bid.mopubPrebidKeyword;
        }
 
        keywords = keywords ?  [NSString stringWithFormat:@"%@,%@", keywords, bidKeyword] : bidKeyword;
 
        if (bidExtra) {
            NSMutableDictionary *extras = [NSMutableDictionary dictionaryWithDictionary:bidExtra];
            [extras addEntriesFromDictionary:bid.metaData];
            bidExtra = extras;
        } else {
            bidExtra = bid.metaData;
        }
    }
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:@"MOPUB_ADUNIT_ID"
                                            keywords:keywords
                                    userDataKeywords:nil
                                            location:nil
                                          customerId:nil
                                   mediationSettings:@[]
                                         localExtras:bidExtra];
   } 
];
