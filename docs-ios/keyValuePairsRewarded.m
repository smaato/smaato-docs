// ViewController.m  
#import "ViewController.h"
@import SmaatoSDKRewardedAds;
   
@interface ViewController () <SMARewardedInterstitialDelegate>
@end
   
@implementation ViewController
   
- (void)viewDidLoad {
    [super viewDidLoad];
    [self callWhenYouNeedRewardedAds];
}
   
- (void)callWhenYouNeedRewardedAds {
    // Let's create and set targeting parameters    
    SMAKeyValuePairs *KVP = [SMAKeyValuePairs new];
	// replace with your key-value pairs configured within your SPX account
    [KVP setTargetingValue:@"30" forKey:@"Age"]; 
	// replace with your key-value pairs configured within your SPX account
    [KVP setTargetingValues:@[@"Demo", @"Stage"] forKey:@"Application"];
    SMARewardedInterstitial.keyValuePairs = KVP;
   
    // Send request, after replacing with your 'AdSpaceID' configured in your SPX account.    
    [SmaatoSDK loadRewardedInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID" delegate:self];
}
   
@end
