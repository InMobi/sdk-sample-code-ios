//
//  IMClassicAdViewController.m
//  Ads Demo
//
//  Copyright (c) 2015 Inmobi. All rights reserved.
//

#import "IMClassicAdViewController.h"
#import <InMobiSDK/InMobiSDK.h>
#import "IMAppIds.h"

@interface IMClassicAdViewController () <IMBannerDelegate, IMInterstitialDelegate>

@property (weak, nonatomic) IBOutlet UIView *adViewPlaceholder;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *adViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *statusActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (strong, nonatomic) IMBanner *adView;
@property (strong, nonatomic) IMInterstitial *adInterstitial;

@end

@implementation IMClassicAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadAdRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadAdRequest {
    
    // Update the user interface for the detail item.
    if (_adItem) {
        if([[_adItem objectForKey:@"Type"] isEqualToString:@"Banner"]) {
            NSLog(@"Initializing %@",[_adItem objectForKey:@"Title"]);
            
            CGSize adSize = CGSizeFromString([_adItem objectForKey:@"Size"]);
            self.title = [_adItem objectForKey:@"Title"];
            _adView = [[IMBanner alloc] initWithFrame:CGRectMake(0, 0, adSize.width, adSize.height)
                                               placementId:INMOBI_BANNER
                                              delegate:self];
            [_adViewPlaceholder addSubview:_adView];
            [_adView load];

            [_statusActivityIndicator startAnimating];
            _statusLabel.hidden = NO;
            
            _adViewHeightConstraint.constant = adSize.height;
            [self.view layoutIfNeeded];
            
        } else {
            if([[_adItem objectForKey:@"Type"] isEqualToString:@"NativeVideo"]){
                _adInterstitial = [[IMInterstitial alloc] initWithPlacementId:INMOBI_INTERSTITIAL_NATIVE_VIDEO delegate:self];
            }
            else if([[_adItem objectForKey:@"Type"] isEqualToString:@"WebVideo"]){
                _adInterstitial = [[IMInterstitial alloc] initWithPlacementId:INMOBI_INTERSTITIAL_RPOSCARD delegate:self];
            }
            else if([[_adItem objectForKey:@"Type"] isEqualToString:@"NativeDisplay"]){
                _adInterstitial = [[IMInterstitial alloc] initWithPlacementId:INMOBI_INTERSTITIAL_STATIC delegate:self];
            }
            
            [_statusActivityIndicator startAnimating];
            _statusLabel.hidden = NO;
            [_adInterstitial load];
    
        }
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

#pragma mark Interstitial Interaction Notifications
/**
 * Notifies the delegate that the ad server has returned an ad. Assets are not yet available.
 * Please use interstitialDidFinishLoading: to receive a callback when assets are also available.
 */
-(void)interstitialDidReceiveAd:(IMInterstitial *)interstitial {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The interstitial has finished loading
 */
-(void)interstitialDidFinishLoading:(IMInterstitial*)interstitial {
    NSLog(@"Loaded %@",[_adItem objectForKey:@"Title"]);
    
    [_statusActivityIndicator stopAnimating];
    _statusLabel.text = @"Ad loaded successfully";
    
    [interstitial showFromViewController:self withAnimation:kIMInterstitialAnimationTypeCoverVertical];
}
/**
 * The interstitial has failed to load with some error.
 */
-(void)interstitial:(IMInterstitial*)interstitial didFailToLoadWithError:(IMRequestStatus*)error {
    NSString *errorMessage = [NSString stringWithFormat:@"Loading ad (%@) failed. Error code: %ld, message: %@", [_adItem objectForKey:@"Title"], (long)[error code], [error localizedDescription]];
    NSLog(@"%@", errorMessage);
    
    [_statusActivityIndicator stopAnimating];
    _statusLabel.text = errorMessage;
}
/**
 * The interstitial would be presented.
 */
-(void)interstitialWillPresent:(IMInterstitial*)interstitial {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The interstitial has been presented.
 */
-(void)interstitialDidPresent:(IMInterstitial *)interstitial {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The interstitial has failed to present with some error.
 */
-(void)interstitial:(IMInterstitial*)interstitial didFailToPresentWithError:(IMRequestStatus*)error {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The interstitial will be dismissed.
 */
-(void)interstitialWillDismiss:(IMInterstitial*)interstitial {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The interstitial has been dismissed.
 */
-(void)interstitialDidDismiss:(IMInterstitial*)interstitial {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/**
 * The interstitial has been interacted with.
 */
-(void)interstitial:(IMInterstitial*)interstitial didInteractWithParams:(NSDictionary*)params {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"params : %@", params);
}
/**
 * The user has performed the action to be incentivised with.
 */
-(void)interstitial:(IMInterstitial*)interstitial rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"rewards : %@", rewards);
}
/**
 * The user will leave application context.
 */
-(void)userWillLeaveApplicationFromInterstitial:(IMInterstitial*)interstitial {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


@end
