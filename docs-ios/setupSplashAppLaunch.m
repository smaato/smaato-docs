// AppDelegate.m
#import "AppDelegate.h"
@import SmaatoSDKInterstitial;
 
// declare the AppDelegate to conform the SMAInterstitialDelegate protocol
@interface AppDelegate () <SMAInterstitialDelegate>
@property (nonatomic, strong) SMAInterstitial *interstitial;
@end
 
@implementation AppDelegate

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    SMAAdRequestParams *requestParams = [SMAAdRequestParams new];
    requestParams.isSplash = YES;
    [SmaatoSDK loadInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID" delegate:self requestParams:requestParams];
}

// Interstitial successfully loaded
- (void)interstitialDidLoad:(SMAInterstitial *)interstitial {
    self.interstitial = interstitial;
    [self.interstitial showFromViewController:self];
}
  
// Interstitial failed to load
- (void)interstitial:(SMAInterstitial *)interstitial didFailWithError:(NSError *)error {
    NSLog(@"Interstitial failed to load with error: %@", error.localizedDescription);
}
 
// Interstitial ads TTL has expired
- (void)interstitialDidTTLExpire:(SMAInterstitial *)interstitial {
    NSLog(@"Interstitial TTL has expired");
}

// all other interstitial delegates are supported
 
@end
