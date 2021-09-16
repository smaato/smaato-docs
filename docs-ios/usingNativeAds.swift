internal var moPubNative: MoPubNative! = MoPubNative(self, NATIVE_AD_ID, self)
var mediaViewBinder: SmaatoMoPubNativeViewBinder! = SmaatoMoPubNativeViewBinder
var Builder: SmaatoMoPubNativeViewBinder!
internal var mediaAdRenderer: SmaatoMoPubNativeRenderer! = SmaatoMoPubNativeRenderer(mediaViewBinder)
moPubNative.registerAdRenderer(mediaAdRenderer)
