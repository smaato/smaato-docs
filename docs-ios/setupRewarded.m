// ViewController.m
#import "ViewController.h"
@import SmaatoSDKRewardedAds;
 
// declare the ViewController to conform the SMARewardedInterstitialDelegate protocol
 
@interface ViewController () <SMARewardedInterstitialDelegate>
@property (nonatomic, strong) SMARewardedInterstitial *rewardedInterstitial;
@end
 
@implementation ViewController
 
 - (void)viewDidLoad {
    [super viewDidLoad];
    // you can call this whenever you need the rewarded ad (not just in viewDidLoad())
    [self callWhenYouNeedRewardedVideo];
}
 
 - (void)callWhenYouNeedRewardedVideo {
    // load rewarded ad with desired ad size
    [SmaatoSDK loadRewardedInterstitialForAdSpaceId:@"<SMAATO_ADSPACE_ID_HERE>" delegate:self];
}

// Rewarded Video successfully loaded
- (void)rewardedInterstitialDidLoad:(SMARewardedInterstitial *)rewardedInterstitial {
    self.rewardedInterstitial = rewardedInterstitial;
    [rewardedInterstitial showFromViewController:self];
}
  
// Rewarded Video failed to load
- (void)rewardedInterstitialDidFail:(SMARewardedInterstitial *)rewardedInterstitial withError:(NSError *)error {
    NSLog(@"Rewarded Video did fail loading with error: %@", error.localizedDescription);
}
 
// Rewarded Video TTL has expired
- (void)rewardedInterstitialDidTTLExpire:(SMARewardedInterstitial *)rewardedInterstitial {
    NSLog(@"Rewarded Video TTL has expired");
}
 
// Rewarded interstitial finishes playing
- (void)rewardedInterstitialDidReward:(SMARewardedInterstitial *)rewardedInterstitial {
    NSLog(@"Rewarded Video finishes playing");
}
 
@end