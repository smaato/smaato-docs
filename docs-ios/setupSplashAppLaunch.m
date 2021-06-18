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
 
@end
