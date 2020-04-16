import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import androidx.annotation.NonNull;
import com.smaato.sdk.banner.ad.BannerAdSize;
import com.smaato.sdk.banner.widget.BannerView;

public class YourActivity extends Activity {

    // find bannerView you setup in your activity.xml
    BannerView bannerView = (BannerView) findViewById(R.id.bannerView);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // load banner with desired size
        bannerView.loadAd("SMAATO_ADSPACE_ID_HERE", BannerAdSize.XX_LARGE_320x50);
    }
  
  // You can also set BannerView.EventListener to listen to events describing the advertisement lifecycle:
  bannerView.setEventListener(new BannerView.EventListener() {
    @Override
    // banner ad successfully loaded
    public void onAdLoaded(@NonNull BannerView bannerView) {}
    @Override
    // banner ad failed to load
    public void onAdFailedToLoad(@NonNull BannerView bannerView, @NonNull BannerError bannerError) {}
    @Override
    // banner ad was seen by the user
    public void onAdImpression(@NonNull BannerView bannerView) {}
    @Override
    // banner ad was clicked by the user
    public void onAdClicked(@NonNull BannerView bannerView) {}
    @Override
    // banner ad Time to Live expired
    public void onAdTTLExpired(@NonNull BannerView bannerView) {}
});
  
  /* If your UI component (that hosts the BannerView) is being destroyed, 
  BannerView.destroy() should be called in order to properly release BannerView resources: */
  @Override
    public void onDestroy() {
        super.onDestroy();
        bannerView.destroy();
    }

}