import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import androidx.annotation.NonNull;
import com.smaato.sdk.rewarded.RewardedInterstitial;
import com.smaato.sdk.rewarded.RewardedInterstitialAd;
import com.smaato.sdk.rewarded.RewardedError;
import com.smaato.sdk.rewarded.RewardedRequestError;
import com.smaato.sdk.rewarded.EventListener;

public class YourActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // load rewarded ad
        RewardedInterstitial.loadAd("SMAATO_ADSPACE_ID", eventListener);

    }
  
  EventListener eventListener = new EventListener() {
    @Override
    //show rewarded ad when it loaded successfully
    public void onAdLoaded(@NonNull RewardedInterstitialAd rewardedInterstitialAd) {
      rewardedInterstitialAd.showAd();
    }
    
    @Override
    // rewarded ad failed to load
    public void onAdFailedToLoad(@NonNull RewardedRequestError rewardedRequestError) {}
    
    @Override
    // rewarded ad had an unexpected error
    public void onAdError(@NonNull RewardedInterstitialAd rewardedInterstitialAd, @NonNull RewardedError rewardedError {}
  
    @Override
    // rewarded ad was closed by the user
    public void onAdClosed(@NonNull RewardedInterstitialAd rewardedInterstitialAd) {}
  
    @Override
    // rewarded ad was clicked by the user
    public void onAdClicked(@NonNull RewardedInterstitialAd rewardedInterstitialAd) {}
  
    @Override
    // rewarded ad started playing
    public void onAdStarted(@NonNull RewardedInterstitialAd rewardedInterstitialAd) {}
  
    @Override
    // rewarded ad finished playing and was watched all the way through
    public void onAdReward(@NonNull RewardedInterstitialAd rewardedInterstitialAd) {
        // rewarded your user here!
    }
  
    @Override
    // rewarded ad Time to Live expired
    public void onAdTTLExpired(@NonNull RewardedInterstitialAd rewardedInterstitialAd) {}
   };

}
