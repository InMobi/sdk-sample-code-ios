//
//  ViewController.m
//  NativeSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

@import InMobiSDK.IMNative;
@import InMobiSDK.IMNativeDelegate;

#ifndef INMOBI_NATIVE_PLACEMENT
#define INMOBI_NATIVE_PLACEMENT  1444208519758
#endif
#import "ViewController.h"

@interface ViewController () <IMNativeDelegate>
@property (nonatomic, strong) IMNative* native;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) UIView* nativeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.native = [[IMNative alloc] initWithPlacementId:INMOBI_NATIVE_PLACEMENT delegate:self];
    [self.native load];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Notifies the delegate that the native ad has finished loading
 */
-(void)nativeDidFinishLoading:(IMNative*)native {
    NSLog(@"InMobi Native ad did finish loading");
    [self parseNativeContent:native.adContent];
}
/**
 * Notifies the delegate that the native ad has failed to load with error.
 */
-(void)native:(IMNative*)native didFailToLoadWithError:(IMRequestStatus*)error {
    NSLog(@"InMobi Native ad failed to load with error : %@", error);
}
/**
 * Notifies the delegate that the native ad would be presenting a full screen content.
 */
-(void)nativeWillPresentScreen:(IMNative*)native {
    NSLog(@"InMobi Native ad will present a screen");
}
/**
 * Notifies the delegate that the native ad has presented a full screen content.
 */
-(void)nativeDidPresentScreen:(IMNative*)native {
    NSLog(@"InMobi Native ad has presented a screen");
}
/**
 * Notifies the delegate that the native ad would be dismissing the presented full screen content.
 */
-(void)nativeWillDismissScreen:(IMNative*)native {
    NSLog(@"InMobi Native ad will dismiss a presented screen");
}
/**
 * Notifies the delegate that the native ad has dismissed the presented full screen content.
 */
-(void)nativeDidDismissScreen:(IMNative*)native {
    NSLog(@"InMobi Native ad dismissed a presented screen");
}
/**
 * Notifies the delegate that the user will be taken outside the application context.
 */
-(void)userWillLeaveApplicationFromNative:(IMNative*)native {
    NSLog(@"User will leave the application from an InMobi Native ad");
}
/**
 * Notifies the delegate that the nativeStrands ad impression has been tracked
 */
-(void)nativeAdImpressed:(IMNative*)native {
    NSLog(@"InMobi Native ad has tracked an impression");
}

#pragma mark Native ad parsing methods
- (void)parseNativeContent:(NSString*)nativeContent {
    
    if (nativeContent==nil) {
        return;
    }
    NSData* data = [nativeContent dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error = nil;
    NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSMutableDictionary* nativeJsonDict = [NSMutableDictionary dictionaryWithDictionary:jsonDict];
    if (error == nil && nativeJsonDict != nil) {

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            NSDictionary* iconDict = [nativeJsonDict valueForKey:@"icon_xhdpi"];
            
            NSString* iconUrlString = [[iconDict valueForKey:@"url"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
            
            NSURL* iconURL = [NSURL URLWithString:iconUrlString];
            
            NSData* iconImgdata = [NSData dataWithContentsOfURL:iconURL];
            self.iconImage = [UIImage imageWithData:iconImgdata];
            
            [self buildNativeView];
            
        });
    }
    return;
}

#pragma mark Native ad display methods

- (void)buildNativeView {
    dispatch_async(dispatch_get_main_queue(), ^{
       
        self.nativeView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
        
        //Build the icon
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 48, 48)];
        iconView.image = self.iconImage;
        
        [self.nativeView addSubview:iconView];
        
        //Add the sponsered tag
        UILabel* sponsoredTag = [[UILabel alloc] initWithFrame:CGRectMake(280, 1, 40, 10)];
        sponsoredTag.text = @"Sponsored";
        sponsoredTag.textColor = [UIColor lightGrayColor];
        sponsoredTag.font = [UIFont systemFontOfSize:6];
        
        [self.nativeView addSubview:sponsoredTag];
        
        //Add the CTA Button
        UIButton* ctaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        ctaButton.frame = CGRectMake(52, 1, 100, 48);
        [ctaButton addTarget:self action:@selector(ctaButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [ctaButton setTitle:@"Click Me!!" forState:UIControlStateNormal];
        
        [self.nativeView addSubview:sponsoredTag];
        
        //Add the ad to the view controller
        [self.view addSubview:self.nativeView];
        
        //IMP: Bind the Native ad to this view
        [IMNative bindNative:self.native toView:self.nativeView];
    });
}

-(void)ctaButtonClicked {
    [self.native reportAdClickAndOpenLandingURL:nil];
    //IMP: Remove the ad and call unbind
    [IMNative unBindView:self.nativeView];
    [self.nativeView removeFromSuperview];
    
    [self.native load];
}

@end
