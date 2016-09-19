//
//  ViewController.m
//  BannerSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

#ifndef INMOBI_BANNER_PLACEMENT
#define INMOBI_BANNER_PLACEMENT     1447912324502
#endif

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IMBanner* banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    /*
     * Code to integrate an InMobi banner programmatically.
     * Provide a frame to your banner according to your requirements.
     */
    
    self.banner = [[IMBanner alloc] initWithFrame:CGRectMake(0, 400, 320, 50) placementId:INMOBI_BANNER_PLACEMENT];
    
    //Optional: set a delegate to be notified if the banner is loaded/failed etc.
    self.banner.delegate = self;
    
    [self.banner load];
    
    [self.view addSubview:self.banner];
    
    /*
     * Code to integrate an InMobi banner via Interface Builder
     */
    
    self.bannerIB.placementId = INMOBI_BANNER_PLACEMENT;
    [self.bannerIB load];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Banner callbacks

/**
 * Notifies the delegate that the banner has finished loading
 */
-(void)bannerDidFinishLoading:(IMBanner*)banner {
    NSLog(@"InMobi Banner finished loading");
}
/**
 * Notifies the delegate that the banner has failed to load with some error.
 */
-(void)banner:(IMBanner*)banner didFailToLoadWithError:(IMRequestStatus*)error {
    NSLog(@"InMobi Banner failed to load with error %@", error);
}
/**
 * Notifies the delegate that the banner was interacted with.
 */
-(void)banner:(IMBanner*)banner didInteractWithParams:(NSDictionary*)params {
    NSLog(@"InMobi Banner did interact with params : %@", params);
}
/**
 * Notifies the delegate that the user would be taken out of the application context.
 */
-(void)userWillLeaveApplicationFromBanner:(IMBanner*)banner {
    NSLog(@"User will leave application from InMobi Banner");
}
/**
 * Notifies the delegate that the banner would be presenting a full screen content.
 */
-(void)bannerWillPresentScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner will present a screen");
}
/**
 * Notifies the delegate that the banner has finished presenting screen.
 */
-(void)bannerDidPresentScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner finished presenting a screen");
}
/**
 * Notifies the delegate that the banner will start dismissing the presented screen.
 */
-(void)bannerWillDismissScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner will dismiss a presented screen");
}
/**
 * Notifies the delegate that the banner has dismissed the presented screen.
 */
-(void)bannerDidDismissScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner dismissed a presented screen");
}
/**
 * Notifies the delegate that the user has completed the action to be incentivised with.
 */
-(void)banner:(IMBanner*)banner rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    NSLog(@"InMobi Banner rewarded action completed. Rewards : %@", rewards);
}


@end
