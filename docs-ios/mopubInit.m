// AppDelegate.m 
#import "AppDelegate.h"
  
@import SmaatoSDKCore; // Import SmaatoSDKCore 
@import MoPub; // Import MoPub
@implementation AppDelegate
  
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization:@ <AD_UNIT_ID>"];
 
    sdkConfig.globalMediationSettings = @[];
    sdkConfig.loggingLevel = MPBLogLevelInfo;
    sdkConfig.allowLegitimateInterest = YES;
    sdkConfig.additionalNetworks = @[SMAMoPubBaseAdapterConfiguration.class];
     
    NSMutableDictionary *smaatoConfig = [NSMutableDictionary new];
    [smaatoConfig setObject:@"<Publisher_Id>" forKey:@"publisherId"];
    [smaatoConfig setObject:@(YES) forKey:@"httpsOnly"];
    [smaatoConfig setObject:@(NO) forKey:@"loggingDisabled"];
    [smaatoConfig setObject:@(kSMALogLevelError) forKey:@"logLevel"];
    [smaatoConfig setObject:@(kSMAMaxAdContentRatingUndefined) forKey:@"maxAdContentRating"];
 
    sdkConfig.mediatedNetworkConfigurations = [@{@"SMAMoPubBaseAdapterConfiguration":smaatoConfig} mutableCopy];
 
    [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig completion:^{
        NSLog(@"SDK initialization complete");
        // SDK initialization complete. Ready to make ad requests.
        SmaatoSDK.gpsEnabled = YES;
        SmaatoSDK.userGender = kSMAGenderFemale;
        SmaatoSDK.userAge = @30;
        SmaatoSDK.userSearchQuery = @"yoga, vegan, san+francisco";
    }];
     
    return YES;
}
  
@end