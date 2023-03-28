//
//  ViewController.swift
//  NativeRebootSampleSwift
//
//  Created by Utpal Kumar Jha on 10/08/17.
//  Copyright © 2017 Inmobi. All rights reserved.
//

import UIKit
import InMobiSDK.IMNative
import InMobiSDK.IMNativeDelegate

let INMOBI_NATIVE_PLACEMENT: Int64 = 1681413960173

class ViewController: UIViewController,IMNativeDelegate {
       
    var native: IMNative?
    
    @IBOutlet weak var AdTitle: UILabel!
    
    @IBOutlet weak var AdIcon: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        native = IMNative(placementId: INMOBI_NATIVE_PLACEMENT);
        native?.delegate = self;
        native?.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func nativeDidFinishLoading(_ native: IMNative!) {
        NSLog("InMobi Native Did finished loading");
        self.contentView.addSubview(native.primaryView(ofWidth: self.contentView.frame.size.width));
        self.AdTitle.text = native.adTitle;
        self.AdIcon.image = native.adIcon;
        // Additonal information needs to be supplied here
    }
    
    func nativeWillPresentScreen(_ native: IMNative!) {
        NSLog("InMobi Native Will Present Screen");
    }
    
    func nativeWillDismissScreen(_ native: IMNative!) {
        NSLog("InMobi Native Will Dismiss Screen");
    }
    
    func nativeDidDismissScreen(_ native: IMNative!) {
        NSLog("InMobi Native Did Dismiss Screen");
    }
    
    func nativeAdImpressed(_ native: IMNative!) {
        NSLog("InMobi Native Has Tracked an impression");
    }
    
    func nativeDidPresentScreen(_ native: IMNative!) {
        NSLog("InMobi Native Did Present Screen");
    }
    
    func userWillLeaveApplication(from native: IMNative!) {
        NSLog("User Will Leave Application");
    }

    func nativeDidFinishPlayingMedia(_ native: IMNative!) {
        NSLog("InMobi Native Did Finish Playing Media");
    }
    
    func native(_ native: IMNative!, didFailToLoadWithError error: IMRequestStatus!) {
        NSLog("InMobi Native failed to load with error : %@", error);
    }
    
    public func native(_ native: IMNative!, rewardActionCompletedWithRewards rewards: [AnyHashable : Any]!){
        NSLog("Reward Action Completed With Rewards : %@", rewards);
    }
    
    public func native(_ native: IMNative!, didInteractWithParams params: [AnyHashable : Any]!){
        NSLog("InMobi Did Interact With Params :%@",params);
        
    }
    public func userDidSkipPlayingMedia(from native: IMNative!) {
        NSLog("User Did Skip Playing Media ");
    }
    
    func native(_ native: IMNative!, adAudioStateChanged audioStateMuted: Bool) {
        if (audioStateMuted) {
            NSLog("Inline video-ad audio state changed to mute");
        } else {
            NSLog("Inline video-ad audio state changed to unmute");
        }
        //This is called when inline video audio state changes.
    }
}

