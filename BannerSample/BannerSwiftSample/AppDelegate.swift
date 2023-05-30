//
//  AppDelegate.swift
//  BannerSwiftSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

import InMobiSDK
let INMOBI_ACCOUNT_ID: String = "4028cb8b2c3a0b45012c406824e800ba"

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
         * Enable logging for better debuggability. Please turn off the logs before submitting your App to the AppStore
         */
        IMSdk.setLogLevel(IMSDKLogLevel.debug)
        /*
         * Initialize the InMobi SDK immediately after the app launches.
         *
         * For EU Region use the following init api to pass user consent for data collection, for GDPR Complaince.
         */
        let conscentDict = [IMCommonConstants.IM_GDPR_CONSENT_AVAILABLE : "true"]
        IMSdk.initWithAccountID(INMOBI_ACCOUNT_ID,
                                consentDictionary: conscentDict,
                                andCompletionHandler: { (error) in
                                    if let err = error {
                                        print("\(err.localizedDescription)")
                                    }
                                })
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

