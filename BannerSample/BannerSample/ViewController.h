//
//  ViewController.h
//  BannerSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

@import InMobiSDK.IMBanner;
@import InMobiSDK.IMBannerDelegate;

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <IMBannerDelegate>

@property (nonatomic, weak) IBOutlet IMBanner* bannerIB;

@end

