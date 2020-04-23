// ViewController.m 
#import "ViewController.h"
@import SmaatoSDKBanner;
   
@interface ViewController ()
   
// SMABannerView is linked in the Interface Builder with ViewController via IBOutlet.
@property (nonatomic) IBOutlet SMABannerView *bannerView;
@end
   
@implementation ViewController
   
- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Let's create and set targeting parameters    
    SMAKeyValuePairs *KVP = [SMAKeyValuePairs new];
	// replace with your key-value pairs configured within your SPX account
    [KVP setTargetingValue:@"30" forKey:@"Age"];
	// replace with your key-value pairs configured within your SPX account
    [KVP setTargetingValues:@[@"Demo", @"Stage"] forKey:@"Application"];    
    SMABannerView.keyValuePairs = KVP;
   
    // Send request, after replacing with your 'AdSpaceID' configured in your SPX account.
    [self.bannerView loadWithAdSpaceId:@"SMAATO_ADSPACE_ID" adSize:kSMABannerAdSizeXXLarge_320x50];
}
   
@end
