import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import androidx.annotation.NonNull;
import com.smaato.sdk.nativead.NativeAd;
import com.smaato.sdk.nativead.NativeAdAssets;
import com.smaato.sdk.nativead.NativeAdRequest;
import com.smaato.sdk.nativead.NativeAdError;
import com.smaato.sdk.nativead.NativeAdRenderer;
import com.smaato.sdk.nativead.NativeAdView;

class YourActivity extends Activity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        NativeAdRequest request;

        request.builder().adSpaceId("130783664");
        request.builder().shouldReturnUrlsForImageAssets(false); // if manually rendering
        // if auto-rendering, set above value to true

        // load native ad
        NativeAd.loadAd(com.smaato.sdk.sys.Lifecycling.of(this), request, listener);
    }

    NativeAd.Listener listener = new NativeAd.Listener() {

        @Override
        public void onAdLoaded(@NonNull NativeAd nativeAd, @NonNull NativeAdRenderer renderer) {

            // IMPORTANT: IF YOU CHOSE MANUAL RENDERING, EXECUTE THE BELOW CODE:
            View adView = View(); // Inflate your ad view or create it programmatically

            // Register ad view for impression tracking and user clicks handling
            renderer.registerForImpression(adView);
            renderer.registerForClicks(adView.findViewById(R.id.cta));

            // Explicit rendering of raw assets into views
            NativeAdAssets assets = renderer.getAssets();
            adView.findViewById(R.id.title).setText(assets.title());
            adView.findViewById(R.id.text).setText(assets.text());
            adView.findViewById(R.id.cta).setText(assets.cta());

            // If you have chosen shouldReturnUrlsForImageAssets(true) it NativeAdRequest,
            // then you have care yourself about image creatives downloading and rendering,
            // using UrlConnection class or any library for image loading like Picasso or Glide.
            if (assets.icon() != null) {
                Picasso.load(assets.icon().uri()).into(adView.findViewById(R.id.icon));
            }

            // If you have chosen shouldReturnUrlsForImageAssets(false) (default),
            // then SmaatoSDK will care about loading all creatives and you will
            // able to use them like a Drawable objects
            if (assets.icon() != null) {
                adView.findViewById(R.id.icon).setImageDrawable(assets.icon().drawable());
            }

            content.addView(adView); // Add adView into your view hierarchy

            // IMPORTANT: IF YOU CHOSE AUTO RENDERING, EXECUTE THE BELOW CODE:
            View adView = ... // Inflate your ad view or create it programmatically

            NativeAdView nativeAdView = new SmaatoNativeAdView(adView); // Create NativeAdView
            renderer.renderInView(nativeAdView); // Render your view using SmaatoSDK
            // SmaatoSDK will care about loading all creatives and display them in certain views.

            // Register ad view for impression tracking and user clicks handling
            renderer.registerForImpression(adView);
            renderer.registerForClicks(nativeAdView.ctaView());

            content.addView(adView); // Add adView into your view hierarchy
        }

        @Override
        public void onAdFailedToLoad(@NonNull NativeAd nativeAd, @NonNull NativeAdError nativeAdError) {

        }

        @Override
        public void onAdImpressed(@NonNull NativeAd nativeAd) {

        }

        @Override
        public void onAdClicked(@NonNull NativeAd nativeAd) {

        }

        @Override
        public void onTtlExpired(@NonNull NativeAd nativeAd) {

        }
    };
}
