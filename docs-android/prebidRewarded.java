private RewardedAd mRewardedAd;
  private final String TAG = "MainActivity";

UnifiedBidding.prebidRewardedInterstitial("SMAATO_ADSPACE_ID", prebidListener);
 
private final UnifiedBidding.PrebidListener prebidListener = (ubBid, ubBidRequestError) ->
            Threads.runOnUi(() -> {
                if (ubBidRequestError != null) {
                    Log.d(TAG, "SmaatoSdk PreBid error: " + ubBidRequestError.error);
                }
 
                if (ubBid == null) {
                    Log.d(TAG, "SmaatoSdk PreBid error: empty response");
                    return;
                }
 
                SmaatoRewardedVideoMediationSettings settings = new SmaatoRewardedVideoMediationSettings();
                settings.put(
                    SmaatoRewardedVideoMediationSettings.UNIQUE_ID_KEY,
                    ubBid.metadata.get(SmaatoRewardedVideoMediationSettings.UNIQUE_ID_KEY)
                );
             
                AdManagerAdRequest kvpRequest = new AdManagerAdRequest.Builder().build();
                Map<String, String> ubKVP = new HashMap<String, String>();
                ubKVP.put("smaub", ubBid.mopubPrebidKeyword);
                kvpRequest.customTargeting = ubKVP;
             
                
                RewardedAd.load(this, "YOUR_GAM_AD_UNIT_ID", kvpRequest, new RewardedAdLoadCallback() {
                  @Override
                  public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                  // Handle the error.
                  Log.d(TAG, loadAdError.getMessage());
                  mRewardedAd = null;
                  }

                 @Override
                 public void onAdLoaded(@NonNull RewardedAd rewardedAd) {
                 mRewardedAd = rewardedAd;
                 Log.d(TAG, "Ad was loaded.");
                 }
               });
             
       });
