//...
MoPubInterstitial mpInterstitial = MoPubInterstitial(context, MOPUB_ADUNIT_ID);
 
//...
UnifiedBidding.prebidInterstitial(/*"SMAATO_ADSPACE_ID"*/, (ubBid,  prebidRequestError) -> {
   if (ubBid != null) {
       // Let's assume this is the max price
       float maxPrice = 0.1F;
 
       String bidKeyword;
       if (ubBid.bidPrice > maxPrice) {
           bidKeyword = String.format(Locale.US, "smaato_cpm:%.2f", maxPrice);
       } else {
           bidKeyword = ubBid.mopubPrebidKeyword;
       }
 
       String interstitialKeywords = mpInterstitial.getKeywords();
       interstitialKeywords = TextUtils.isEmpty(adViewKeywords)
               ? bidKeyword
               : String.format("%s, %s", adView.keywords, bidKeyword);
       mpInterstitial.setKeywords(adViewKeywords);
       mpInterstitial.setLocalExtras(ubBid.metadata);
   } else if (prebidRequestError != null) {
       /* Timber.e(prebidRequestError.error.toString()) */
   }
      mpInterstitial.load();
});
