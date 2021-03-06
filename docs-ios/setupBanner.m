// ViewController.m
#import "ViewController.h"
@import SmaatoSDKBanner;
 
// declare the ViewController to conform the SMABannerViewDelegate protocol
 
@interface ViewController () <SMABannerViewDelegate>
	// get the Smaato banner view from the interface
 @property (nonatomic, weak) IBOutlet SMABannerView *bannerView;
@end
 
@implementation ViewController
 
 - (void)viewDidLoad {
    [super viewDidLoad];
		// (optional) set the desired auto-reload time interval
    	self.bannerView.autoreloadInterval = kSMABannerAutoreloadIntervalVeryShort; 
		// (required) set the delegate
    	self.bannerView.delegate = self;     
		// load the banner, with desired size
    	[self.bannerView loadWithAdSpaceId:@"SMAATO_ADSPACE_ID" adSize:kSMABannerAdSizeXXLarge_320x50];
}

#pragma mark - <SMABannerViewDelegate>
 
// return presenting view controller to display Ad contents modally, e.g. in internal WebBrowser
- (UIViewController *)presentingViewControllerForBannerView:(SMABannerView *)bannerView {
    return self;
}

// check if banner has loaded successfully
- (void)bannerViewDidLoad:(SMABannerView *)bannerView {
   NSLog(@"Banner has loaded successfully!");
}

// check if banner failed to load
- (void)didFailWithError:(SMABannerView *)bannerView :(Error *)error {
   NSLog(@"Banner failed to load with error: \(error.localizedDescription)");
}
 
// notification callback: ads TTL has expired
- (void)bannerViewDidTTLExpire:(SMABannerView *)bannerView {
    NSLog(@"Banner TTL has expired. You should load new one.");
}

@end
