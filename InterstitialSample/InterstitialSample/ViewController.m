//
//  ViewController.m
//  InterstitialSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

@import InMobiSDK.IMInterstitial;
@import InMobiSDK.IMInterstitialDelegate;

#ifndef INMOBI_INTERSTITIAL_PLACEMENT
#define INMOBI_INTERSTITIAL_PLACEMENT   1446377525790
#endif

#import "ViewController.h"

@interface ViewController () <IMInterstitialDelegate>
@property (nonatomic, strong) IMInterstitial* interstitial;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.interstitial = [[IMInterstitial alloc] initWithPlacementId:INMOBI_INTERSTITIAL_PLACEMENT delegate:self];
    [self.interstitial load];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Notifies the delegate that the ad server has returned an ad. Assets are not yet available.
 * Please use interstitialDidFinishLoading: to receive a callback when assets are also available.
 */
-(void)interstitialDidReceiveAd:(IMInterstitial *)interstitial {
    NSLog(@"InMobi Interstitial received an ad");
}
/**
 * Notifies the delegate that the interstitial has finished loading and can be shown instantly.
 */
-(void)interstitialDidFinishLoading:(IMInterstitial*)interstitial {
    NSLog(@"InMobi Interstitial finished loading");
    if (interstitial.isReady) {
        [interstitial showFromViewController:self];
    }
}
/**
 * Notifies the delegate that the interstitial has failed to load with some error.
 */
-(void)interstitial:(IMInterstitial*)interstitial didFailToLoadWithError:(IMRequestStatus*)error {
    NSLog(@"InMobi Interstitial failed to load with error : %@", error);
}
/**
 * Notifies the delegate that the interstitial would be presented.
 */
-(void)interstitialWillPresent:(IMInterstitial*)interstitial {
    NSLog(@"InMobi Interstitial will be presented");
}
/**
 * Notifies the delegate that the interstitial has been presented.
 */
-(void)interstitialDidPresent:(IMInterstitial *)interstitial {
    NSLog(@"InMobi Interstitial has been presented");
}
/**
 * Notifies the delegate that the interstitial has failed to present with some error.
 */
-(void)interstitial:(IMInterstitial*)interstitial didFailToPresentWithError:(IMRequestStatus*)error {
    NSLog(@"InMobi Interstitial has failed to present with error : %@", error);
}
/**
 * Notifies the delegate that the interstitial will be dismissed.
 */
-(void)interstitialWillDismiss:(IMInterstitial*)interstitial {
    NSLog(@"InMobi Interstitial will be dismissed");
}
/**
 * Notifies the delegate that the interstitial has been dismissed.
 */
-(void)interstitialDidDismiss:(IMInterstitial*)interstitial {
    NSLog(@"InMobi Interstitial has been dismissed");
}
/**
 * Notifies the delegate that the interstitial has been interacted with.
 */
-(void)interstitial:(IMInterstitial*)interstitial didInteractWithParams:(NSDictionary*)params {
    NSLog(@"InMobi Interstitial did interact with params : %@", params);
}
/**
 * Notifies the delegate that the user has performed the action to be incentivised with.
 */
-(void)interstitial:(IMInterstitial*)interstitial rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    NSLog(@"InMobi Interstitial completed rewarded action. Rewards : %@", rewards);
}
/**
 * Notifies the delegate that the user will leave application context.
 */
-(void)userWillLeaveApplicationFromInterstitial:(IMInterstitial*)interstitial {
    NSLog(@"User will leave the application from InMobi Interstitial");
}

@end
