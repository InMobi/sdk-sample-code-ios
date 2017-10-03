//
//  IMPreRollViewController.h
//  InMobiAdsDemo
//
//  Created by Utpal Kumar Jha on 03/10/17.
//  Copyright © 2017 InMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <InMobiSDK/InMobiSDK.h>

@interface IMPreRollViewController : UIViewController
@property(nonatomic,strong) IMNative *InMobiNativeAd;
@property (nonatomic) long long placementID;
@end
