//
//  ViewController.swift
//  InterstitialSwiftSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

import InMobiSDK.IMInterstitial
import InMobiSDK.IMInterstitialDelegate

let INMOBI_INTERSTITIAL_PLACEMENT: Int64 = 1446377525790

import UIKit

class ViewController: UIViewController, IMInterstitialDelegate {

    var interstitial: IMInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        interstitial = IMInterstitial(placementId: INMOBI_INTERSTITIAL_PLACEMENT, delegate: self)
        interstitial!.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func interstitialDidReceiveAd(_ interstitial: IMInterstitial!) {
        NSLog("InMobi Interstitial received and ad");
    }
    
    /**
     * Notifies the delegate that the interstitial has finished loading and can be shown instantly.
     */
     func interstitialDidFinishLoading(_ interstitial: IMInterstitial!) {
        NSLog("InMobi Interstitial finished loading an ad");
        
        if interstitial.isReady() {
            interstitial.show(from: self)
        }
    }
    
    /**
     * Notifies the delegate that the interstitial has failed to load with some error.
     */
     func interstitial(_ interstitial: IMInterstitial!, didFailToLoadWithError error: IMRequestStatus!) {
        NSLog("InMobi Interstitial failed to load an ad with error : %@", error);
    }
    
    /**
     * Notifies the delegate that the interstitial would be presented.
     */
     func interstitialWillPresent(_ interstitial: IMInterstitial!) {
        NSLog("InMobi Interstitial will be presented");
    }
    
    /**
     * Notifies the delegate that the interstitial has been presented.
     */
     func interstitialDidPresent(_ interstitial: IMInterstitial!) {
        NSLog("InMobi Interstitial has been presented");
    }
    
    /**
     * Notifies the delegate that the interstitial has failed to present with some error.
     */
     func interstitial(_ interstitial: IMInterstitial!, didFailToPresentWithError error: IMRequestStatus!) {
        NSLog("InMobi Interstitial failed to present with error : %@", error);
    }
    
    /**
     * Notifies the delegate that the interstitial will be dismissed.
     */
     func interstitialWillDismiss(_ interstitial: IMInterstitial!) {
        NSLog("InMobi Interstitial will be dismissed");
    }
    
    /**
     * Notifies the delegate that the interstitial has been dismissed.
     */
     func interstitialDidDismiss(_ interstitial: IMInterstitial!) {
        NSLog("InMobi Interstitial has been dismissed");
    }
    
    /**
     * Notifies the delegate that the interstitial has been interacted with.
     */
     func interstitial(_ interstitial: IMInterstitial!, didInteractWithParams params: [AnyHashable : Any]!) {
        NSLog("InMobi Interstitial did interact with params : %@", params);
    }
    
    /**
     * Notifies the delegate that the user has performed the action to be incentivised with.
     */
     func interstitial(_ interstitial: IMInterstitial!, rewardActionCompletedWithRewards rewards: [AnyHashable : Any]!) {
        NSLog("InMobi Interstitial completed rewarded action : %@", rewards);
    }
    
    /**
     * Notifies the delegate that the user will leave application context.
     */
     func userWillLeaveApplication(from interstitial: IMInterstitial!) {
        NSLog("User will leave application from InMobi Interstitial");
    }

    
}

