private AdManagerInterstitialAd mAdManagerInterstitialAd;
UnifiedBidding.prebidInterstitial(/*"SMAATO_ADSPACE_ID"*/, (ubBid,  prebidRequestError) -> {
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
      AdManagerInterstitialAd.load(this,"YOUR_GAM_AD_UNIT_ID", kvpRequest,
        new AdManagerInterstitialAdLoadCallback() {
      @Override
      public void onAdLoaded(@NonNull AdManagerInterstitialAd interstitialAd) {
        // The mAdManagerInterstitialAd reference will be null until
        // an ad is loaded.
        mAdManagerInterstitialAd = interstitialAd;
        Log.i(TAG, "onAdLoaded");
      }

      @Override
      public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
        // Handle the error
        Log.i(TAG, loadAdError.getMessage());
        mAdManagerInterstitialAd = null;
      }
    });
});
