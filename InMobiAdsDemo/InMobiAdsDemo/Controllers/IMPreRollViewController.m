//
//  IMPreRollViewController.m
//  InMobiAdsDemo
//
//  Copyright © 2017 InMobi. All rights reserved.

#import "IMPreRollViewController.h"
#import "AppConstants.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>


@interface IMPreRollViewController () <IMNativeDelegate>
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) CGFloat temp_screen;

@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (nonatomic,strong) UIView *prerollAdView;
@property (weak, nonatomic) IBOutlet UIButton *moviePlayerCloseButton;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (nonatomic,strong) AVPlayerViewController *MoviePlayer;

@end

@implementation IMPreRollViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.showButton addTarget:self action:@selector(showAd) forControlEvents:UIControlEventTouchUpInside];
    [self setDefaultValues];
    [self instantiateNativeAd];
    
    self.prerollAdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _screenWidth, _screenHeight)];
    self.prerollAdView.hidden = true;
    [self.view addSubview:self.prerollAdView];
    
    [self instantiateMoviePlayer];
    [self.moviePlayerCloseButton addTarget:self
                                action:@selector(closeMoviePlayer)
                      forControlEvents:UIControlEventTouchUpInside];
    
    self.moviePlayerCloseButton.transform = CGAffineTransformRotate(_moviePlayerCloseButton.transform,90.0 * M_PI/180.0);
    
    self.moviePlayerCloseButton.hidden = true;
    
    
    [self.view bringSubviewToFront:self.MoviePlayer.view];
    [self.view bringSubviewToFront:self.moviePlayerCloseButton];
}

-(void)setDefaultValues{
    self.screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.screenHeight = [[UIScreen mainScreen] bounds].size.height;
    self.messageLabel.hidden = true;
    self.showButton.hidden = true;
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
    self.inMobiNativeAd = [[IMNative alloc] initWithPlacementId:self.placementID];
    self.inMobiNativeAd.delegate = self;
    [self.inMobiNativeAd load];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    [self.inMobiNativeAd recyclePrimaryView];
    self.inMobiNativeAd.delegate = nil;
    self.inMobiNativeAd = nil;
}

#pragma mark - Utility methods

-(void)showAd{
    UIView* AdPrimaryViewOfCorrectWidth = [self.inMobiNativeAd primaryViewOfWidth:self.screenHeight];
    CGFloat degreesOfRotation = 90.0;
    AdPrimaryViewOfCorrectWidth.transform = CGAffineTransformRotate(AdPrimaryViewOfCorrectWidth.transform,
                                                                    degreesOfRotation * M_PI/180.0);
    AdPrimaryViewOfCorrectWidth.frame = CGRectMake(0, 0, self.screenWidth, self.screenHeight);
    [self.prerollAdView addSubview:AdPrimaryViewOfCorrectWidth];
    self.navigationController.navigationBar.layer.zPosition = -1;
    self.prerollAdView.hidden = false;
    self.showButton.hidden = true;
}

-(void)dismissAd{
    self.prerollAdView.hidden = true;
    self.navigationController.navigationBar.layer.zPosition = 0;
    [self.inMobiNativeAd recyclePrimaryView];
    self.inMobiNativeAd = nil;
    self.inMobiNativeAd = [[IMNative alloc] initWithPlacementId:self.placementID];
    self.inMobiNativeAd.delegate = self;
    [self.inMobiNativeAd load];
    [self.MoviePlayer.player play];
    self.navigationController.navigationBar.layer.zPosition = -1;
    self.MoviePlayer.view.hidden = false;
    self.moviePlayerCloseButton.hidden = false;
}

-(void)closeMoviePlayer{
    [self.MoviePlayer.player pause];
    self.MoviePlayer.view.hidden = true;
    self.moviePlayerCloseButton.hidden = true;
    self.navigationController.navigationBar.layer.zPosition = 0;
}

-(void)ShowMessage:(NSString *)message dismissAfter:(NSTimeInterval)interval{
    self.messageLabel.text = message;
    self.messageLabel.hidden = FALSE;
    [self performSelector:@selector(dismissAfterDelay) withObject:nil afterDelay:interval];
}

-(void)dismissAfterDelay{
    self.messageLabel.hidden = TRUE;
}

#pragma mark - native ad call back

/*The native ad notifies its delegate that it is ready. Fetching publisher-specific ad asset content from native.adContent. The publisher will specify the format. If the publisher does not provide a format, no ad will be loaded.*/
-(void)nativeDidFinishLoading:(IMNative*)native{
    self.showButton.hidden = false;
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
