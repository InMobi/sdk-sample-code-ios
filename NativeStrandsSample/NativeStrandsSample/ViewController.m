//
//  ViewController.m
//  NativeStrandsSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//
@import InMobiSDK.IMNativeStrands;
@import InMobiSDK.IMNativeStrandsDelegate;

#ifndef INMOBI_NATIVE_STRANDS_PLACEMENT
#define INMOBI_NATIVE_STRANDS_PLACEMENT 1452140578642
#endif

#import "ViewController.h"

@interface ViewController () <IMNativeStrandsDelegate>

@property (nonatomic, strong) IMNativeStrands* nativeStrands;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.nativeStrands = [[IMNativeStrands alloc] initWithPlacementId:INMOBI_NATIVE_STRANDS_PLACEMENT];
    self.nativeStrands.delegate = self;
    [self.nativeStrands load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Notifies the delegate that the nativeStrands ad has finished loading
 */
-(void)nativeStrandsDidFinishLoading:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands finished loading");
    /*
     * Once the native strands object is loaded, fetch the constructed view by calling the strandsView api.
     */
    [self.view addSubview:[nativeStrands strandsView]];
}
/**
 * Notifies the delegate that the nativeStrands ad has failed to load with error.
 */
-(void)nativeStrands:(IMNativeStrands*)nativeStrands didFailToLoadWithError:(IMRequestStatus*)error {
    NSLog(@"InMobi Native Strands failed to load with error : %@", error);
}
/**
 * Notifies the delegate that the nativeStrands ad would be presenting a full screen content.
 */
-(void)nativeStrandsWillPresentScreen:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands will present a screen");
}
/**
 * Notifies the delegate that the nativeStrands ad has presented a full screen content.
 */
-(void)nativeStrandsDidPresentScreen:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands has presented a screen");
}
/**
 * Notifies the delegate that the nativeStrands ad would be dismissing the presented full screen content.
 */
-(void)nativeStrandsWillDismissScreen:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands will dismiss a presented screen");
}
/**
 * Notifies the delegate that the nativeStrands ad has dismissed the presented full screen content.
 */
-(void)nativeStrandsDidDismissScreen:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands dismissed a presented screen");
}
/**
 * Notifies the delegate that the user will be taken outside the application context.
 */
-(void)userWillLeaveApplicationFromNativeStrands:(IMNativeStrands*)nativeStrands {
    NSLog(@"User will leave the application from InMobi Native Strands");
}
/**
 * Notifies the delegate that the nativeStrands ad impression has been tracked
 */
-(void)nativeStrandsAdImpressed:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands has tracked an impression");
}
/**
 * Notifies the delegate that the user has clicked on the ad.
 */
-(void)nativeStrandsAdClicked:(IMNativeStrands*)nativeStrands {
    NSLog(@"InMobi Native Strands has been clicked");
}


@end
