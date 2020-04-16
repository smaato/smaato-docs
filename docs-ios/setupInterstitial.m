// ViewController.m
#import "ViewController.h"
@import SmaatoSDKInterstitial;
 
// declare the ViewController to conform the SMAInterstitialDelegate protocol
@interface ViewController () <SMAInterstitialDelegate>
@property (nonatomic, strong) SMAInterstitial *interstitial;
@end
 
@implementation ViewController
 
 - (void)viewDidLoad {
    [super viewDidLoad];
    // you can call this whenever you need the interstitial (not just in viewDidLoad())
    [self callWhenYouNeedInterstitial];
}
 
 - (void)callWhenYouNeedInterstitial {
    // load interstitial ad with desired ad size
    [SmaatoSDK loadInterstitialForAdSpaceId:@"<SMAATO_ADSPACE_ID_HERE>" delegate:self];
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
 
 
@end