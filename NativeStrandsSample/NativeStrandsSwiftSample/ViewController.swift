//
//  ViewController.swift
//  NativeStrandsSwiftSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//
import InMobiSDK.IMNativeStrands
import InMobiSDK.IMNativeStrandsDelegate

let INMOBI_NATIVE_STRANDS_PLACEMENT: Int64 = 1452140578642

import UIKit

class ViewController: UIViewController, IMNativeStrandsDelegate {

    var nativeStrands: IMNativeStrands?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nativeStrands = IMNativeStrands(placementId: INMOBI_NATIVE_STRANDS_PLACEMENT);
        nativeStrands?.delegate = self;
        nativeStrands?.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     * Notifies the delegate that the nativeStrands ad has finished loading
     */
     func nativeStrandsDidFinishLoading(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands finished loading");
        
        /*
         * Once the native strands object is loaded, fetch the constructed view by calling the strandsView api.
         */
        self.view.addSubview(nativeStrands.strandsView())
        
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad has failed to load with error.
     */
     func nativeStrands(_ nativeStrands: IMNativeStrands!, didFailToLoadWithError error: IMRequestStatus!) {
        NSLog("InMobi Native Strands failed to load with error : %@", error);
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad would be presenting a full screen content.
     */
     func nativeStrandsWillPresentScreen(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands will present a screen");
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad has presented a full screen content.
     */
     func nativeStrandsDidPresentScreen(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands has presented a screen");
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad would be dismissing the presented full screen content.
     */
     func nativeStrandsWillDismissScreen(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands will dismiss a presented screen");
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad has dismissed the presented full screen content.
     */
     func nativeStrandsDidDismissScreen(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands dismissed a presented screen");
    }
    
    /**
     * Notifies the delegate that the user will be taken outside the application context.
     */
     func userWillLeaveApplication(from nativeStrands: IMNativeStrands!) {
        NSLog("User will leave the application from InMobi Native Strands");
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad impression has been tracked
     */
     func nativeStrandsAdImpressed(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands has tracked an impression");
    }
    
    /**
     * Notifies the delegate that the user has clicked on the ad.
     */
     func nativeStrandsAdClicked(_ nativeStrands: IMNativeStrands!) {
        NSLog("InMobi Native Strands has been clicked");
    }

}

