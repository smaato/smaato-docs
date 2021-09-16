let settings = MPStaticNativeAdRendererSettings()
settings.renderingViewClass = YourCustomNativeAdView.self
     
guard let config = MPStaticNativeAdRenderer.rendererConfiguration(with: settings) else { return }
config.supportedCustomEvents = ["SMAMoPubSmaatoNativeAdapter"]
