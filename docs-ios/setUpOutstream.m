// ViewController.m
#import "ViewController.h"
@import SmaatoSDKOutstream;
 
// declare the ViewController to conform the SMABannerViewDelegate protocol
 
@interface ViewController () <SMABannerViewDelegate>
	// get the Smaato banner view from the interface
 @property (nonatomic, weak) IBOutlet SMAOutstreamView *outstreamView;
@end
 
@implementation ViewController
 
 - (void)viewDidLoad {
    [super viewDidLoad]; 
		// (required) set the delegate
    	self.outstreamView.delegate = self;    
		// load the banner, with desired size
    	[self.outstreamView loadWithAdSpaceId:@"SMAATO_ADSPACE_ID"
                                outstreamAdSize:kSMAOutstreamAdSizeRectangle_300x300];
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
