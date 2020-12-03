// ViewController.m
#import "ViewController.h"
@import SmaatoSDKInterstitial;
 
// declare the AppDelegate to conform the SMAInterstitialDelegate protocol
@interface AppDelegate () <SMAInterstitialDelegate>
@property (nonatomic, strong) SMAInterstitial *interstitial;
@end
 
@implementation ViewController

 - (void)viewDidLoad {
    [super viewDidLoad];
    SMAAdRequestParams *requestParams = [SMAAdRequestParams new];
    requestParams.isSplash = YES;
    [SmaatoSDK loadInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID" delegate:self requestParams:requestParams];
}

// Interstitial did successfully loaded
- (void)interstitialDidLoad:(SMAInterstitial *)interstitial {
    self.interstitial = interstitial;
    [self.interstitial showFromViewController:self];
}
  
// Interstitial did fail loading
- (void)interstitial:(SMAInterstitial *)interstitial didFailWithError:(NSError *)error {
    NSLog(@"Interstitial did fail loading with error: %@", error.localizedDescription);
}
 
// Interstitial ads TTL has expired
- (void)interstitialDidTTLExpire:(SMAInterstitial *)interstitial {
    NSLog(@"Interstitial TTL has expired");
}
 
@end
