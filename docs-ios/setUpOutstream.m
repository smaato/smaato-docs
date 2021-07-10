// ViewController.m
#import "ViewController.h"
@import SmaatoSDKBanner;
@import SmaatoSDKOutstream;
 
// declare the ViewController to conform the SMABannerViewDelegate protocol
 
@interface ViewController () <SMABannerViewDelegate>
	// get the Smaato outstream view from the interface
 @property (nonatomic, weak) IBOutlet SMAOutstreamView *outstreamView;
@end
 
@implementation ViewController
 
 - (void)viewDidLoad {
    [super viewDidLoad]; 
		// (required) set the delegate
    	self.outstreamView.delegate = self;    
		// load the outstream view, with desired size
    	[self.outstreamView loadWithAdSpaceId:@"SMAATO_ADSPACE_ID"
                                outstreamAdSize:kSMAOutstreamAdSizeRectangle_300x300];
}

#pragma mark - <SMABannerViewDelegate>
 
// return presenting view controller to display Ad contents modally, e.g. in internal WebBrowser
- (UIViewController *)presentingViewControllerForBannerView:(SMABannerView *)bannerView {
    return self;
}

// check if outstream ad has loaded successfully
- (void)bannerViewDidLoad:(SMABannerView *)bannerView {
   NSLog(@"Outstream ad has loaded successfully!");
}

// check if outstream ad failed to load
- (void)didFailWithError:(SMABannerView *)bannerView :(Error *)error {
   NSLog(@"Outstream ad failed to load with error: \(error.localizedDescription)");
}
 
// notification callback: ads TTL has expired
- (void)bannerViewDidTTLExpire:(SMABannerView *)bannerView {
    NSLog(@"Outstream TTL has expired. You should load new one.");
}

@end
