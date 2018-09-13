//
//  ViewController.m
//  NativeRebootSample
//
//  Created by Utpal Kumar Jha on 10/08/17.
//  Copyright © 2017 Inmobi. All rights reserved.
//

#import "ViewController.h"
@import InMobiSDK.IMNative;
@import InMobiSDK.IMNativeDelegate;

#ifndef INMOBI_ACCOUNT_ID
#define INMOBI_NATIVE_PLACEMENT 1501663239052
#endif
@interface ViewController () <IMNativeDelegate>

@property (nonatomic,strong) IMNative* native;
@property (weak, nonatomic) IBOutlet UILabel *AdTitle;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *adIconImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.native = [[IMNative alloc] initWithPlacementId:INMOBI_NATIVE_PLACEMENT];
    self.native.delegate = self;
    [self.native load];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)nativeDidFinishLoading:(IMNative*)native{
    NSLog(@"InMobi Native finished loading");
    [self.contentView addSubview:[native primaryViewOfWidth:self.contentView.frame.size.width]];
    self.AdTitle.text = native.adTitle;
    self.adIconImage.image = native.adIcon;
}
/**
 * Notifies the delegate that the native ad has failed to load with error.
 */
-(void)native:(IMNative*)native didFailToLoadWithError:(IMRequestStatus*)error{
    NSLog(@"InMobi Native failed to load with error : %@",error);
}
/**
 * Notifies the delegate that the native ad would be presenting a full screen content.
 */
-(void)nativeWillPresentScreen:(IMNative*)native{
    NSLog(@"InMobi Native will present a screen");
}
/**
 * Notifies the delegate that the native ad has presented a full screen content.
 */
-(void)nativeDidPresentScreen:(IMNative*)native{
    NSLog(@"InMobi Native Did present a screen");
}
/**
 * Notifies the delegate that the native ad would be dismissing the presented full screen content.
 */
-(void)nativeWillDismissScreen:(IMNative*)native{
    NSLog(@"InMobi Native Will Dismiss a screen");
}
/**
 * Notifies the delegate that the native ad has dismissed the presented full screen content.
 */
-(void)nativeDidDismissScreen:(IMNative*)native{
    NSLog(@"InMobi Native Did Dismiss a screen");
}
/**
 * Notifies the delegate that the user will be taken outside the application context.
 */
-(void)userWillLeaveApplicationFromNative:(IMNative*)native{
    NSLog(@"User Will leave the application from Inmobi Native");
}
/**
 * Notifies the delegate that the native ad impression has been tracked
 */
-(void)nativeAdImpressed:(IMNative*)native{
    NSLog(@"InMobi Native has tracked an impression");
}
/**
 * Notifies the delegate that the user has performed the action to be incentivised with.
 */
-(void)native:(IMNative*)native rewardActionCompletedWithRewards:(NSDictionary*)rewards{
    NSLog(@"Reward Action Completed With Rewards  : %@",rewards);
}
/**
 * Notifies the delegate that the native ad has been interacted with.
 */
-(void)native:(IMNative*)native didInteractWithParams:(NSDictionary*)params{
    NSLog(@"InMobi Native did Interact With Params : %@",params);
}
/**
 * Notifies the delegate that the native ad has finished playing media.
 */
-(void)nativeDidFinishPlayingMedia:(IMNative*)native{
    NSLog(@"InMobi Native Did Finish Playing Media");
}
/**
 * Notifies the delegate that the media audio state has been changed - mute/unmute.
 * @param audioStateMuted is YES when audio is turned off and NO when audio is turned on.
 */
-(void)native:(IMNative *)native adAudioStateChanged:(BOOL)audioStateMuted{
    if (audioStateMuted) {
        NSLog(@"Inline video-ad audio state changed to mute");
    } else {
        NSLog(@"Inline video-ad audio state changed to unmute");
    }
    //This is called when inline video audio state changes.
}

@end
