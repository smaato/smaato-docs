// NativeAdSmaatoView.m
#import "NativeAdSmaatoView.h"
@import SmaatoSDKCore;
@import SmaatoSDKNative;

// make a native ad custom view that is of type UIView and of SMANativeView
@interface NativeAdSmaatoView()

@property (weak, nonatomic) UILabel *smaSponsoredLabel;
@property (weak, nonatomic) UILabel *smaMainTextLabel;
@property (weak, nonatomic) UILabel *smaTitleLabel;
@property (weak, nonatomic) UIView *smaIconView;
@property (weak, nonatomic) UIView *smaMediaView;
@property (weak, nonatomic) UILabel *smaCTALabel;
@property (weak, nonatomic) UIView *smaPrivacyView;

@end
