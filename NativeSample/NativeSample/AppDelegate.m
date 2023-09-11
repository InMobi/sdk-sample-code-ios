//
//  AppDelegate.m
//  NativeRebootSample
//
//  Created by Utpal Kumar Jha on 10/08/17.
//  Copyright © 2017 Inmobi. All rights reserved.
//

#import "AppDelegate.h"
@import InMobiSDK;

#define INMOBI_ACCOUNT_ID @"4028cb8b2c3a0b45012c406824e800ba"
#define US_PRIVACY_STRING @"<ENTER YOUR PRIVACY STRING HERE>"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
     * Initialize the InMobi SDK immediately after the app launches.
     *
     * For EU Region use the following init api to pass user consent for data collection, for GDPR Complaince.
     */
    NSMutableDictionary *consentdict=[[NSMutableDictionary alloc]init];
    [consentdict setObject:@"true" forKey:IMCommonConstants.IM_GDPR_CONSENT_AVAILABLE];
    void (^completionBlock)(NSError*) = ^( NSError* _Nullable  error) {
        if (error) {
            NSLog(@"SDK Initialization Error - %@", error.description);
        }
        else {
            NSLog(@"IM Mediation SDK successfully initialized");
        }
    };
    [IMSdk initWithAccountID:INMOBI_ACCOUNT_ID consentDictionary:consentdict andCompletionHandler:completionBlock];
    
    /*
     * Enable logging for better debuggability. Please turn off the logs before submitting your App to the AppStore
     */
    [IMSdk setLogLevel:IMSDKLogLevelDebug];
    
    // Use the US Privacy Laws APIs to comply with privacy regulations
    [IMPrivacyCompliance setDoNotSell:YES];
    [IMPrivacyCompliance setUSPrivacyString:US_PRIVACY_STRING];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
