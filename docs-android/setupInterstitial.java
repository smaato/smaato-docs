import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import androidx.annotation.NonNull;
import com.smaato.sdk.interstitial.Interstitial;
import com.smaato.sdk.interstitial.InterstitialAd;
import com.smaato.sdk.interstitial.InterstitialError;
import com.smaato.sdk.interstitial.InterstitialRequestError;
import com.smaato.sdk.interstitial.EventListener;

public class YourActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // load interstitial ad
        Interstitial.loadAd("SMAATO_ADSPACE_ID", eventListener);

    }
  
     EventListener eventListener = new EventListener() {
       @Override
       //show interstitial ad when it loaded successfully
       public void onAdLoaded(@NonNull InterstitialAd interstitialAd) {
          interstitialAd.showAd(YOUR_ACTIVITY_HERE);
       }

       @Override
       // interstitial ad failed to load
       public void onAdFailedToLoad(@NonNull InterstitialRequestError interstitialRequestError) {}

       @Override
       // interstitial ad had an unexpected error 
       public void onAdError(@NonNull InterstitialAd interstitialAd, @NonNull InterstitialError interstitialError) {}

       @Override
       // interstitial ad opened and was shown successfully
       public void onAdOpened(@NonNull InterstitialAd interstitialAd) {}

       @Override
       // interstitial ad was closed by the user
       public void onAdClosed(@NonNull InterstitialAd interstitialAd) {}

       @Override
       // interstitial ad was clicked by the user
       public void onAdClicked(@NonNull InterstitialAd interstitialAd) {}

       @Override
       // interstitial ad was viewed by the user
       public void onAdImpression(@NonNull InterstitialAd interstitialAd) {}

       @Override
       // interstitial ad Time to Live expired
       public void onAdTTLExpired(@NonNull InterstitialAd interstitialAd) {}
   };

}
