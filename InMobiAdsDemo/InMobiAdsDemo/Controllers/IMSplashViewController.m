//
//  IMSplashViewController.m
//  InMobiAdsDemo
//
//  Created by Utpal Kumar Jha on 03/10/17.
//  Copyright © 2017 InMobi. All rights reserved.
//

#import "IMSplashViewController.h"

BOOL isSecondScreenDisplayed;
@interface IMSplashViewController () <IMNativeDelegate>

@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) CGFloat temp_screen;

@property (weak, nonatomic) IBOutlet UIButton *show_button;
@property (weak, nonatomic) IBOutlet UILabel *pw_label;
@property (weak, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (nonatomic,strong) UIView *SplashAdView;
@end

@implementation IMSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     isSecondScreenDisplayed = NO;
     self.screenWidth = [[UIScreen mainScreen] bounds].size.width;
     self.screenHeight = [[UIScreen mainScreen] bounds].size.height;
    self.SplashAdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenWidth, self.screenHeight)];
    [self.show_button addTarget:self
                     action:@selector(showAd)
           forControlEvents:UIControlEventTouchUpInside];
    [self setDefaultProperties];
    [self.activityIndicator startAnimating];
//    [self addDefaultViews];
    [self initiateNativeAd];
}

-(void)setDefaultProperties{
    self.pw_label.hidden = true;
    self.show_button.hidden = true;
}

-(void)initiateNativeAd{
    self.InMobiNativeAd = [[IMNative alloc] initWithPlacementId:self.placementID];
    self.InMobiNativeAd.delegate = self;
    [self.InMobiNativeAd load];
}

-(void)addDefaultViews{
 //   self.SplashAdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenWidth, self.screenHeight)];
    self.SplashAdView.hidden = false;
    [self.view addSubview:_SplashAdView];
    [self.view bringSubviewToFront:_SplashAdView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    self.InMobiNativeAd.delegate = nil;
    self.InMobiNativeAd = nil;
}

#pragma mark - utility methods

-(void)ShowIfSplashAdIsReady{
    if(self.InMobiNativeAd.isReady){
        self.show_button.hidden = false;
    }
    else{
        [self ShowMessage:@"Not enough time to load ad" dismissAfter:2.0];
    }
}

-(void)showAd{
//    UIView* AdPrimaryViewOfCorrectWidth = [_InMobiNativeAd primaryViewOfWidth:_screenWidth];
    self.SplashAdView = [_InMobiNativeAd primaryViewOfWidth:_screenWidth];
//    [self.SplashAdView addSubview:AdPrimaryViewOfCorrectWidth];
 //   self.SplashAdView.hidden = false;
    self.show_button.hidden = true;
    [self addDefaultViews];
    [self performSelector:@selector(dismissAd) withObject:nil afterDelay:6.0];
}

-(void)dismissAd{
    if(isSecondScreenDisplayed){
        NSLog(@"Do not Dismiss the Ad while it is being Displayed");
    }
    else{
        [self reloadAd];
//        [self addDefaultViews];
    }
}

-(void)reloadAd{
    self.navigationController.navigationBar.layer.zPosition = 0;
    [self.SplashAdView removeFromSuperview];
    self.show_button.hidden = false;
}

- (void)ShowMessage:(NSString *)message dismissAfter:(NSTimeInterval)interval{
    self.pw_label.hidden = false;
    self.pw_label.text = message;
    [self performSelector:@selector(dismissAfterDelay) withObject:nil afterDelay:interval];
}

- (void)dismissAfterDelay{
    self.pw_label.hidden = TRUE;
}

#pragma mark - native call backs

/*The native ad notifies its delegate that it is ready. Fetching publisher-specific ad asset content from native.adContent. The publisher will specify the format. If the publisher does not provide a format, no ad will be loaded.*/
-(void)nativeDidFinishLoading:(IMNative*)native{
    NSLog(@"Native Ad load Successful");
    [self.activityIndicator stopAnimating];
    self.show_button.hidden = false;
}
/*The native ad notifies its delegate that an error has been encountered while trying to load the ad.Check IMRequestStatus.h for all possible errors.Try loading the ad again, later.*/
-(void)native:(IMNative*)native didFailToLoadWithError:(IMRequestStatus*)error{
    NSLog(@"Native Ad load Failed");
    [self ShowMessage:@"No Fill OR Response Error" dismissAfter:2.0];
}
/* Indicates that the native ad is going to present a screen. */
-(void)nativeWillPresentScreen:(IMNative*)native{
    NSLog(@"Native Ad will present screen");
    isSecondScreenDisplayed = YES;
}
/* Indicates that the native ad has presented a screen. */
-(void)nativeDidPresentScreen:(IMNative*)native{
    NSLog(@"Native Ad did present screen");
}
/* Indicates that the native ad is going to dismiss the presented screen. */
-(void)nativeWillDismissScreen:(IMNative*)native{
    NSLog(@"Native Ad will dismiss screen");
    isSecondScreenDisplayed = NO;
    [self dismissAd];
}
/* Indicates that the native ad has dismissed the presented screen. */
-(void)nativeDidDismissScreen:(IMNative*)native{
    NSLog(@"Native Ad did dismiss screen");
}
/* Indicates that the user will leave the app. */
-(void)userWillLeaveApplicationFromNative:(IMNative*)native{
    NSLog(@"User leave");
}

-(void)native:(IMNative *)native didInteractWithParams:(NSDictionary *)params{
    NSLog(@"User leave");
}

-(void)nativeAdImpressed:(IMNative *)native{
    NSLog(@"User leave");
}

-(void)native:(IMNative *)native rewardActionCompletedWithRewards:(NSDictionary *)rewards{
    NSLog(@"User leave");
}

-(void)nativeDidFinishPlayingMedia:(IMNative *)native{
    
}


@end
