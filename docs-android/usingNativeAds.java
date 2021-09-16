MoPubNative moPubNative = new MoPubNative(this, NATIVE_AD_ID,this);
SmaatoMoPubNativeViewBinder mediaViewBinder = SmaatoMoPubNativeViewBinder,Builder(R.layout.view_native_mopub);
SmaatoMoPubNativeRenderer mediaAdRenderer = new SmaatoMoPubNativeRenderer(mediaViewBinder);
moPubNative.registerAdRenderer(mediaAdRenderer);
