//
//  ViewController.swift
//  InterstitialSwiftSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//

import InMobiSDK

let INMOBI_INTERSTITIAL_PLACEMENT: Int64 = 1672200162238

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

    func interstitialDidReceiveAd(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial received and ad");
    }
    
    /**
     * Notifies the delegate that the interstitial has finished loading and can be shown instantly.
     */
    func interstitialDidFinishLoading(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial finished loading an ad");
        
        if interstitial.isReady() {
            interstitial.show(from: self)
        }
    }
    
    /**
     * Notifies the delegate that the interstitial has failed to load with some error.
     */
    func interstitial(_ interstitial: IMInterstitial, didFailToLoadWithError error: IMRequestStatus) {
        print("InMobi Interstitial failed to load an ad with error \(error.localizedDescription)");
    }
    
    /**
     * Notifies the delegate that the interstitial would be presented.
     */
    func interstitialWillPresent(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial will be presented");
    }
    
    /**
     * Notifies the delegate that the interstitial has been presented.
     */
    func interstitialDidPresent(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial has been presented");
    }
    
    /**
     * Notifies the delegate that the interstitial has failed to present with some error.
     */
    func interstitial(_ interstitial: IMInterstitial, didFailToPresentWithError error: IMRequestStatus) {
        print("InMobi Interstitial failed to present with error : \(error.localizedDescription)");
    }
    
    /**
     * Notifies the delegate that the interstitial will be dismissed.
     */
    func interstitialWillDismiss(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial will be dismissed");
    }
    
    /**
     * Notifies the delegate that the interstitial has been dismissed.
     */
    func interstitialDidDismiss(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial has been dismissed");
    }
    
    /**
     * Notifies the delegate that the interstitial has been interacted with.
     */
    func interstitial(_ interstitial: IMInterstitial, didInteractWithParams params: [String : Any]?) {
        print("InMobi Interstitial did interact with params : \(params as AnyObject)");
    }
    
    /**
     * Notifies the delegate that the user has performed the action to be incentivised with.
     */
    func interstitial(_ interstitial: IMInterstitial, rewardActionCompletedWithRewards rewards: [String : Any]) {
        print("InMobi Interstitial completed rewarded action : \(rewards as AnyObject)");
    }
    
    /**
     * Notifies the delegate that the user will leave application context.
     */
    func userWillLeaveApplicationFromInterstitial(_ interstitial: IMInterstitial) {
        print("User will leave application from InMobi Interstitial");
    }
    
    /**
     * Notifies the delegate that the interstitial ad Impressed.
     */
    func interstitialAdImpressed(_ interstitial: IMInterstitial) {
        print("InMobi Interstitial ad Impressed");
    }

    
}

