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
    SMAAdRequestParams *requestParams = [SMAAdRequestParams new];
    requestParams.isSplash = YES;
    [SmaatoSDK loadInterstitialForAdSpaceId:@"SMAATO_ADSPACE_ID" delegate:self requestParams:requestParams];
}
 
@end
