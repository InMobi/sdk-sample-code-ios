//
//  IMPreRollViewController.h
//  InMobiAdsDemo
//
//  Copyright © 2017 InMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <InMobiSDK/InMobiSDK.h>

@interface IMPreRollViewController : UIViewController
@property(nonatomic,strong) IMNative *inMobiNativeAd;
@property (nonatomic) long long placementID;
@end
