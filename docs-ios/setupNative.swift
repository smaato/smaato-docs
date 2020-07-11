import UIKit
import SmaatoSDKCore
import SmaatoSDKNative
 
class ViewController: UIViewController {
    private var nativeAd: SMANativeAd?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let adRequest = SMANativeAdRequest(adSpaceId:"SMAATO_ADSPACE_ID_HERE") else {
            return
        }
        nativeAd = SMANativeAd()
        adRequest.allowMultipleImages = false
        adRequest.returnUrlsForImageAssets = false
        nativeAd.delegate = self   // (required) set the delegate
        nativeAd.load(with: adRequest)
    }
}
 
extension ViewController: SMANativeAdDelegate {

    // Sent when the native ad loads a creative successfully
    func nativeAd(_ nativeAd: SMANativeAd, didLoadWith renderer: SMANativeAdRenderer) {
        
        // -----> IMPORTANT: EXECUTE THE BELOW CODE IF YOU CHOSE MANUAL RENDERING: <-----
        
        print("\(nativeAd) loaded successfully")   
        //Create new instance of your custom designed native ad view: load from .xib or create programmatically
        guard let adView = NativeAdCustomView.instantiateFromNib() else {
            return nil
        }
 
        //Register ad view for impression tracking and user clicks handling
        renderer.registerView(forImpression: adView)
        renderer.registerViews(forClickAction: [adView.titleTextLabel,  adView.mainTextLabel, adView.mainImageView, adView.iconImageView, adView.ctaLabel])
     
        //Explicit rendering of native ad raw data into UI controls of given ad view
        let assets = renderer.nativeAssets
        adView.titleTextLabel.text = assets.title
        adView.mainTextLabel.text = assets.mainText
        adView.sponsoredLabel.text = assets.sponsored
        //You should care yourself about image creatives downloading. NextGen SDK provides helper class for this purpose, but you are able to do it through your lovely Alamofire
        SMANativeImageLoader.loadImage(with: assets.iconURL) { [weak nativeView = adView] (image, error) in
            nativeView?.iconImageView.image = image
        }
        SMANativeImageLoader.loadImage(with: assets.imageURLs?.first) {  [weak nativeView = adView] (image, error) in
           nativeView?.mainImageView.image = image
        }
 
        //Add ad view on the screen
        self.view.addSubview(adView)
        
        // -----> IMPORTANT: EXECUTE THE BELOW CODE IF YOU CHOSE AUTO RENDERING: <-----
        
        print("\(nativeAd) loaded successfully")   
        //Create new instance of your custom designed native ad view that conforms <SMANativeView> protocol: load from .xib or create programmatically
        guard let adView = NativeAdSmaatoView.instantiateFromNib() else {
            return nil
        }
 
        //Download all required image resources and render them in asynchronous mode
        renderer.renderAd(in: adView) {[weak self, weak adRenderer = renderer] (success, error) in
        guard let this = self,
              let renderer = adRenderer else {
               print("No destination for ad")
               return
        }    
        if (success) {
            print("Native ad has been rendered")
            //Register ad view for impression tracking and user clicks handling
            renderer.registerView(forImpression: adView)
            renderer.registerViews(forClickAction: [adView.smaTitleLabel!, adView.smaMainTextLabel!, adView.smaIconView!, adView.smaMediaView!, adView.smaCTALabel!])
            //Add ad view on the screen
            this.view.addSubview(adView)
        } else {
            print("Native ad rendering error \(error?.localizedDescription ?? "")")
        }
      }
    }
 
    // Sent when the native ad fails to load an ad successfully
    func nativeAd(_ nativeAd: SMANativeAd, didFailWithError error: Error) {
        print("\(nativeAd) failed with error: \(error)")
    }
    
    // A view controller that will be used to present modal view controllers
    func presentingViewController(for nativeAd: SMANativeAd) -> UIViewController {
        return self
    }
 
    // Sent when TTL has expired, based on the timestamp from the ad header
    func nativeAdDidTTLExpire(_ nativeAd: SMANativeAd) {
        print("\(nativeAd) TTL has expired. Please load a new one. Tip: show Native before expiration for the best fill rate (you have about 5 minutes after loading completion).")
    }
}
