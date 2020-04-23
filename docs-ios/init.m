// AppDelegate.m
#import "AppDelegate.h"
@import SmaatoSDKCore;
 
@implementation AppDelegate
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {   
    // initialize SDK first!    
    SMAConfiguration *config = [[SMAConfiguration alloc] initWithPublisherId:@"SMAATO_PUBLISHER_ID"];
	// allow HTTPS traffic only
    config.httpsOnly = YES;                 
	// log errors only
    config.logLevel = kSMALogLevelError;    
	// ads content restriction based on age
	config.maxAdContentRating = kSMAMaxAdContentRatingUndefined;
	[SmaatoSDK initSDKWithConfig:config];
	// allow the Smaato SDK to automatically get the user's location and put it inside the ad request
    SmaatoSDK.gpsEnabled = YES;
     
    // optional configuration    
    SmaatoSDK.userGender = kSMAGenderFemale; // usually set after user logs in
    SmaatoSDK.userAge = @30; // usually set after user logs in
    SmaatoSDK.userSearchQuery = @"yoga, vegan, san+francisco";
     
    return YES;
}
