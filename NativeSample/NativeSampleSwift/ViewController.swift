//
//  ViewController.swift
//  NativeRebootSampleSwift
//
//  Created by Utpal Kumar Jha on 10/08/17.
//  Copyright © 2017 Inmobi. All rights reserved.
//

import UIKit
import InMobiSDK

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

    func nativeDidFinishLoading(_ native: IMNative) {
        print("InMobi Native Did finished loading");
        if let aView = native.primaryView(ofWidth: self.contentView.frame.size.width) {
            self.contentView.addSubview(aView)
        }
        self.AdTitle.text = native.adTitle;
        self.AdIcon.image = native.adIcon;
        // Additonal information needs to be supplied here
    }
    
    func nativeWillPresentScreen(_ native: IMNative) {
        print("InMobi Native Will Present Screen");
    }
    
    func nativeWillDismissScreen(_ native: IMNative) {
        print("InMobi Native Will Dismiss Screen");
    }
    
    func nativeDidDismissScreen(_ native: IMNative) {
        print("InMobi Native Did Dismiss Screen");
    }
    
    func nativeAdImpressed(_ native: IMNative) {
        print("InMobi Native Has Tracked an impression");
    }
    
    func nativeDidPresentScreen(_ native: IMNative) {
        print("InMobi Native Did Present Screen");
    }
    
    func userWillLeaveApplicationFromNative(_ native: IMNative) {
        print("User Will Leave Application");
    }

    func nativeDidFinishPlayingMedia(_ native: IMNative) {
        print("InMobi Native Did Finish Playing Media");
    }
    
    func native(_ native: IMNative, didFailToLoadWithError error: IMRequestStatus) {
        print("InMobi Native failed to load with error : \(error.localizedDescription)");
    }
    
    public func native(_ native: IMNative!, rewardActionCompletedWithRewards rewards: [AnyHashable : Any]!){
        print("Reward Action Completed With Rewards : \(rewards as AnyObject)");
    }
    
    func native(_ native: IMNative, didInteractWithParams params: [String : Any]?) {
        print("InMobi Did Interact With Params : \(params as AnyObject)");
    }
    
    public func userDidSkipPlayingMediaFromNative(_ native: IMNative) {
        print("User Did Skip Playing Media ");
    }
    
    func native(_ native: IMNative, adAudioStateChanged audioStateMuted: Bool) {
        if (audioStateMuted) {
            print("Inline video-ad audio state changed to mute");
        } else {
            print("Inline video-ad audio state changed to unmute");
        }
        //This is called when inline video audio state changes.
    }
}

