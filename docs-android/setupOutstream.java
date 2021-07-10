import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import androidx.annotation.NonNull;
import com.smaato.sdk.banner.ad.BannerAdSize;
import com.smaato.sdk.banner.widget.VideoBannerView;

public class YourActivity extends Activity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        // find outstreamView you setup in your activity.xml
        VideoBannerView videoBannerView = (VideoBannerView) findViewById(R.id.videoBannerView);

        // load outstreamView with desired size
        videoBannerView.loadAd(adspaceId, bannerAdSize);
    }
  
  // You can also set BannerView.EventListener to listen to events describing the advertisement lifecycle:
  videoBannerView.setEventListener(new BannerView.EventListener() {
    @Override
    public void onAdLoaded(@NonNull BannerView bannerView) {}
    @Override
    public void onAdFailedToLoad(@NonNull BannerView bannerView, @NonNull BannerError bannerError) {}
    @Override
    public void onAdImpression(@NonNull BannerView bannerView) {}
    @Override
    public void onAdClicked(@NonNull BannerView bannerView) {}
    @Override
    public void onAdTTLExpired(@NonNull BannerView bannerView) {}
});
  
  /* If your UI component (that hosts the VideoBannerView) is being destroyed, 
  VideoBannerView.destroy() should be called in order to properly release VideoBannerView resources: */
  @Override
    public void onDestroy() {
        super.onDestroy();
        videoBannerView.destroy();
    }

}
