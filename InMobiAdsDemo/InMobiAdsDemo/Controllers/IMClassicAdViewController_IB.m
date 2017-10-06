//
//  IMClassicAdViewController_IB.m
//  Ads Demo
//
//  Copyright (c) 2015 Inmobi. All rights reserved.
//

#import "IMClassicAdViewController_IB.h"
#import <InMobiSDK/InMobiSDK.h>
#import "IMAppIds.h"

@interface IMClassicAdViewController_IB () <IMBannerDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *statusActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) IBOutlet IMBanner *adView;

@end

@implementation IMClassicAdViewController_IB

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadAdRequest];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadAdRequest {
    
    // Update the user interface for the detail item.
    if (_adItem) {
        
        self.title = [_adItem objectForKey:@"Title"];
        _adView.placementId = INMOBI_EXBANNER;
        _adView.delegate = self;
        [_adView load];
            
        [_statusActivityIndicator startAnimating];
        _statusLabel.hidden = NO;
        
        _statusLabel.text = @"Loading...";
    }
}

#pragma mark - Banner Delegate

/**
 * The banner has finished loading
 */
-(void)bannerDidFinishLoading:(IMBanner*)banner {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [_statusActivityIndicator stopAnimating];
    _statusLabel.text = [NSString stringWithFormat:@"Loaded ad successfully."];
    
}
/**
 * The banner has failed to load with some error.
 */
-(void)banner:(IMBanner*)banner didFailToLoadWithError:(IMRequestStatus*)error {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *errorMessage = [NSString stringWithFormat:@"Loading ad (%@) failed. Error code: %ld, message: %@", [_adItem objectForKey:@"Title"], (long)[error code], [error localizedDescription]];
    NSLog(@"%@", errorMessage);
    
    [_statusActivityIndicator stopAnimating];
    _statusLabel.text = errorMessage;
    
}
/**
 * The banner was interacted with.
 */
-(void)banner:(IMBanner*)banner didInteractWithParams:(NSDictionary*)params {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"params : %@", params);
}
/**
 * The user would be taken out of the application context.
 */
-(void)userWillLeaveApplicationFromBanner:(IMBanner*)banner {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The banner would be presenting a full screen content.
 */
-(void)bannerWillPresentScreen:(IMBanner*)banner {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The banner has finished presenting screen.
 */
-(void)bannerDidPresentScreen:(IMBanner*)banner {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The banner will start dismissing the presented screen.
 */
-(void)bannerWillDismissScreen:(IMBanner*)banner {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The banner has dismissed the presented screen.
 */
-(void)bannerDidDismissScreen:(IMBanner*)banner {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The user has completed the action to be incentivised with.
 */
-(void)banner:(IMBanner*)banner rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"rewards : %@", rewards);
}

@end
