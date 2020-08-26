//...
MoPubView adView = findViewById(R.id.bannerAdView);
 
//...
UnifiedBidding.prebidBanner(/*"SMAATO_ADSPACE_ID"*/, UBBannerSize.XX_LARGE_320x50, (ubBid,  prebidRequestError) -> {
   if (ubBid != null) {
       // Let's assume this is the max price
       float maxPrice = 0.1F;
 
       String bidKeyword;
       if (ubBid.bidPrice > maxPrice) {
           bidKeyword = String.format(Locale.US, "smaato_cpm:%.2f", maxPrice);
       } else {
           bidKeyword = ubBid.mopubPrebidKeyword;
       }
 
       String adViewKeywords = adView.getKeywords();
       adViewKeywords = TextUtils.isEmpty(adViewKeywords)
               ? bidKeyword
               :  String.format("%s, %s", adView.keywords, bidKeyword);
       adView.setKeywords(adViewKeywords);
       adView.setLocalExtras(ubBid.metadata);
   } else if (prebidRequestError != null) {
       /* Timber.e(prebidRequestError.error.toString()) */
   }
      adView.loadAd();
});
