//...
UnifiedBidding.prebidRewardedInterstitial(SMAATO_UB_REWARDED_AD_SPACE_ID, prebidListener);
 
//...
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
                MoPubRewardedVideoManager.RequestParameters parameters =
                    new MoPubRewardedVideoManager.RequestParameters(ubBid.mopubPrebidKeyword);
                MoPubRewardedVideos.loadRewardedVideo(
                    MOPUB_REWARDED_AD_UNIT_ID,
                    parameters,
                    settings
                );
            });
