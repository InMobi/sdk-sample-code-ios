//
//  IMPreRollViewController.m
//  InMobiAdsDemo
//
//  Created by Utpal Kumar Jha on 03/10/17.
//  Copyright © 2017 InMobi. All rights reserved.
//

#import "IMPreRollViewController.h"
#import "AppConstants.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>


@interface IMPreRollViewController () <IMNativeDelegate>
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) CGFloat temp_screen;

@property (weak, nonatomic) IBOutlet UIButton *show_button;
@property (nonatomic,strong) UIView *PrerollAdView;
@property (weak, nonatomic) IBOutlet UIButton *MoviePlayerCloseButton;
@property (weak, nonatomic) IBOutlet UILabel *pw_label;

@property (nonatomic,strong) AVPlayerViewController *MoviePlayer;

@end

@implementation IMPreRollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.show_button addTarget:self action:@selector(showAd) forControlEvents:UIControlEventTouchUpInside];
    [self setDefaultValues];
    [self instantiateNativeAd];
    
    self.PrerollAdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _screenWidth, _screenHeight)];
    self.PrerollAdView.hidden = true;
    [self.view addSubview:self.PrerollAdView];
    
    [self instantiateMoviePlayer];
    [self.MoviePlayerCloseButton addTarget:self
                                action:@selector(closeMoviePlayer)
                      forControlEvents:UIControlEventTouchUpInside];
    
    self.MoviePlayerCloseButton.transform = CGAffineTransformRotate(_MoviePlayerCloseButton.transform,90.0 * M_PI/180.0);
    
    self.MoviePlayerCloseButton.hidden = true;
    
    
    [self.view bringSubviewToFront:self.MoviePlayer.view];
    [self.view bringSubviewToFront:self.MoviePlayerCloseButton];
}

-(void)setDefaultValues{
    self.screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.screenHeight = [[UIScreen mainScreen] bounds].size.height;
    self.pw_label.hidden = true;
    self.show_button.hidden = true;
}

-(void)instantiateMoviePlayer{
    NSURL *urlString=[NSURL URLWithString:PREROLL_URL];
    AVPlayer *player = [AVPlayer playerWithURL:urlString];
    self.MoviePlayer = [[AVPlayerViewController alloc] init];
    self.MoviePlayer.view.hidden = true;
    self.MoviePlayer.player = player;
    self.MoviePlayer.view.transform = CGAffineTransformRotate(_MoviePlayer.view.transform,
                                                              90.0 * M_PI/180.0);
    self.MoviePlayer.view.frame = CGRectMake(0, 0, self.screenWidth, self.screenHeight);
    [self.view addSubview:self.MoviePlayer.view];
}

-(void)instantiateNativeAd{
    self.InMobiNativeAd = [[IMNative alloc] initWithPlacementId:self.placementID];
    self.InMobiNativeAd.delegate = self;
    [self.InMobiNativeAd load];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    [self.InMobiNativeAd recyclePrimaryView];
    self.InMobiNativeAd.delegate = nil;
    self.InMobiNativeAd = nil;
}

#pragma mark - Utility methods

-(void)showAd{
    UIView* AdPrimaryViewOfCorrectWidth = [self.InMobiNativeAd primaryViewOfWidth:self.screenHeight];
    CGFloat degreesOfRotation = 90.0;
    AdPrimaryViewOfCorrectWidth.transform = CGAffineTransformRotate(AdPrimaryViewOfCorrectWidth.transform,
                                                                    degreesOfRotation * M_PI/180.0);
    AdPrimaryViewOfCorrectWidth.frame = CGRectMake(0, 0, self.screenWidth, self.screenHeight);
    [self.PrerollAdView addSubview:AdPrimaryViewOfCorrectWidth];
    self.navigationController.navigationBar.layer.zPosition = -1;
    self.PrerollAdView.hidden = false;
    self.show_button.hidden = true;
}

-(void)dismissAd{
    self.PrerollAdView.hidden = true;
    self.navigationController.navigationBar.layer.zPosition = 0;
    [self.InMobiNativeAd recyclePrimaryView];
    self.InMobiNativeAd = nil;
    self.InMobiNativeAd = [[IMNative alloc] initWithPlacementId:self.placementID];
    self.InMobiNativeAd.delegate = self;
    [self.InMobiNativeAd load];
    [self.MoviePlayer.player play];
    self.navigationController.navigationBar.layer.zPosition = -1;
    self.MoviePlayer.view.hidden = false;
    self.MoviePlayerCloseButton.hidden = false;
}

-(void)closeMoviePlayer{
    [self.MoviePlayer.player pause];
    self.MoviePlayer.view.hidden = true;
    self.MoviePlayerCloseButton.hidden = true;
    self.navigationController.navigationBar.layer.zPosition = 0;
}

- (void)ShowMessage:(NSString *)message dismissAfter:(NSTimeInterval)interval{
    self.pw_label.text = message;
    self.pw_label.hidden = FALSE;
    [self performSelector:@selector(dismissAfterDelay) withObject:nil afterDelay:interval];
}

- (void)dismissAfterDelay{
    self.pw_label.hidden = TRUE;
}

#pragma mark - native ad call back

/*The native ad notifies its delegate that it is ready. Fetching publisher-specific ad asset content from native.adContent. The publisher will specify the format. If the publisher does not provide a format, no ad will be loaded.*/
-(void)nativeDidFinishLoading:(IMNative*)native{
    self.show_button.hidden = false;
}
/*The native ad notifies its delegate that an error has been encountered while trying to load the ad.Check IMRequestStatus.h for all possible errors.Try loading the ad again, later.*/
-(void)native:(IMNative*)native didFailToLoadWithError:(IMRequestStatus*)error{
    NSLog(@"Native Ad load Failed");
}
/* Indicates that the native ad is going to present a screen. */ -(void)nativeWillPresentScreen:(IMNative*)native{
    NSLog(@"Native Ad will present screen");
}
/* Indicates that the native ad has presented a screen. */
-(void)nativeDidPresentScreen:(IMNative*)native{
    NSLog(@"Native Ad did present screen");
}
/* Indicates that the native ad is going to dismiss the presented screen. */
-(void)nativeWillDismissScreen:(IMNative*)native{
    NSLog(@"Native Ad will dismiss screen");
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
    [self dismissAd];
}




@end
