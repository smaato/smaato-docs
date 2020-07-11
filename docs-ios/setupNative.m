// ViewController.m
#import "ViewController.h"
@import SmaatoSDKCore;
@import SmaatoSDKNative;
 
// declare the ViewController to conform to the SMANativeAdDelegate protocol
@interface ViewController () <SMANativeAdDelegate>
@property (nonatomic, strong) SMANativeAd *nativeAd;
@end
 
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nativeAd = [SMANativeAd new];
    SMANativeAdRequest *adRequest = [[SMANativeAdRequest alloc] initWithAdSpaceId:@"SMAATO_ADSPACE_ID_HERE"];
    adRequest.allowMultipleImages = NO;
    adRequest.returnUrlsForImageAssets = NO;
    self.nativeAd.delegate = self; // (required) set the delegate
    [self.nativeAd loadWithAdRequest:adRequest];
}

//Sent when the native ad loads a creative successfully.
- (void)nativeAd:(SMANativeAd *)nativeAd didLoadWithAdRenderer:(SMANativeAdRenderer *)renderer {

    // -----> IMPORTANT: EXECUTE THE BELOW CODE IF YOU CHOSE MANUAL RENDERING: <-----

    NSLog(@"Native loaded successfully");
    //Create new instance of your custom designed native ad view: load from .xib or create programmatically
    NativeAdCustomView *adView = [NativeAdCustomView demo_instantiateFromNib];
    if (!adView) {
        return nil;
    }
     
    //Register ad view for impression tracking and user clicks handling
    [renderer registerViewForImpression:adView];
    [renderer registerViewsForClickAction:@[adView.titleTextLabel, adView.mainTextLabel, adView.mainImageView, adView.iconImageView, adView.ctaLabel]];
 
    //Explicit rendering of native ad raw data into UI controls of given ad view
    SMANativeAdAssets *assets = renderer.nativeAssets;
    adView.titleTextLabel.text = assets.title;
    adView.mainTextLabel.text = assets.mainText;
    adView.sponsoredLabel.text = assets.sponsored;
    //You should care yourself about image creatives downloading. NextGen SDK provides helper class for this purpose, but you are able to do it through your lovely AFNetworking
    __typeof__(adView) __weak wView = adView;
    [SMANativeImageLoader loadImageWithURL:assets.iconURL completion:^(UIImage *image, NSError *error) {
        __typeof__(adView) sView = wView;
        sView.iconImageView.image = image;
    }];
    [SMANativeImageLoader loadImageWithURL:assets.imageURLs.firstObject completion:^(UIImage *image, NSError * error) {
        __typeof__(adView) sView = wView;
        sView.mainImageView.image = image;
    }];
 
    //Add ad view on the screen
    [self.view addSubview:adView];
    
    
    // -----> IMPORTANT: EXECUTE THE BELOW CODE IF YOU CHOSE AUTO RENDERING: <-----
    
    NSLog(@"Native loaded successfully");
    //Create new instance of your custom designed native ad view that conforms <SMANativeView> protocol: load from .xib or create programmatically
    NativeAdSmaatoView *adView = [NativeAdSmaatoView demo_instantiateFromNib];
    if (!adView || ! [adView conformsToProtocol:@protocol(SMANativeView)]) {
        return nil;
    }
 
    //Download all required image resources and render them in asynchronous mode
    __typeof__(self) __weak wSelf = self;
    [renderer renderAdInView:adView completion:^(BOOL isRendered, NSError *error) {
        __typeof__(self) sSelf = wSelf;
        if (!sSelf) {
            return;
        }
        if (isRendered) {
            NSLog(@"Native ad has been rendered");
            //Register ad view for impression tracking and user clicks handling
            [renderer registerViewForImpression:adView];
            [renderer registerViewsForClickAction:@[adView.smaTitleLabel, adView.smaMainTextLabel, adView.smaIconView, adView.smaMediaView, adView.smaCTALabel]];
            //Add ad view on the screen
            [sSelf.view addSubview:adView];;
        } else {
            NSLog(@"Native ad rendering error %@", error);
        }
    }];
}
 
// Sent when the native ad fails to load an ad successfully
- (void)nativeAd:(SMANativeAd *)nativeAd didFailWithError:(NSError *)error {
    NSLog(@"Native ad failed with error: %@", error);
}
 
// A view controller that will be used to present modal view controllers
- (UIViewController *)presentingViewControllerForNativeAd:(SMANativeAd *)nativeAd {
    return self;
}
 
// Sent when TTL has expired, based on the timestamp from the ad header
- (void)nativeAdDidTTLExpire:(SMANativeAd *)nativeAd {
    NSLog(@"Native ad TTL has expired. Please load a new one. Tip: show Native before expiration for the best fill rate (you have about 5 minutes after loading completion).");
}

@end
