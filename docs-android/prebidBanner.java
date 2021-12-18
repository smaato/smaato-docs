AdManagerAdView adView = new AdManagerAdView(this);
adView.setAdSizes(AdSize.BANNER);
adView.setAdUnitId("YOUR_GAM_AD_UNIT_ID");
UnifiedBidding.prebidBanner(/*"SMAATO_ADSPACE_ID"*/, UBBannerSize.XX_LARGE_320x50, (ubBid,  prebidRequestError) -> {
   if (ubBid != null) {
       // Let's assume this is the max price of your line items (you will want to change this float to yours)
       float maxPrice = 0.1F;
 
       String bidKeyword;
       if (ubBid.bidPrice > maxPrice) {
           bidKeyword = String.format(Locale.US, "smaato_cpm:%.2f", maxPrice);
       } else {
           bidKeyword = ubBid.mopubPrebidKeyword;
       }
       AdManagerAdRequest kvpRequest = new AdManagerAdRequest.Builder().build();
       Map<String, String> ubKVP = new HashMap<String, String>();
       ubKVP.put("smaub", bidKeyword);
       kvpRequest.customTargeting = ubKVP;
   } else if (prebidRequestError != null) {
       /* Timber.e(prebidRequestError.error.toString()) */
   }
      adView.loadAd(kvpRequest);
});
