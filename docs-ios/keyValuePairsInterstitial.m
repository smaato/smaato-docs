// ViewController.m  
#import "ViewController.h"
@import SmaatoSDKInterstitial;
   
@interface ViewController () <SMAInterstitialDelegate>
@end
   
@implementation ViewController
   
- (void)viewDidLoad {
    [super viewDidLoad];
    [self callWhenYouNeedInterstitial];
}
   
- (void)callWhenYouNeedInterstitial {
    // Let's create and set targeting parameters    
    SMAKeyValuePairs *KVP = [SMAKeyValuePairs new];
	// replace with your key-value pairs configured within your SPX account 
    [KVP setTargetingValue:@"30" forKey:@"Age"];  
	// replace with your key-value pairs configured within your SPX account
    [KVP setTargetingValues:@[@"Demo", @"Stage"] forKey:@"Application"];
    SMAInterstitial.keyValuePairs = KVP;
 
    // Send request, after replacing with your 'AdSpaceID' configured in your SPX account.
    [SmaatoSDK loadInterstitialForAdSpaceId:@"AdSpaceID" delegate:self];
}
   
@end