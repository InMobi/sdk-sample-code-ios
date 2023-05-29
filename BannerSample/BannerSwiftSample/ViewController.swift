//
//  ViewController.swift
//  BannerSwiftSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//
import InMobiSDK

let INMOBI_BANNER_PLACEMENT: Int64 = 1672335615808

import UIKit

class ViewController: UIViewController, IMBannerDelegate {

    @IBOutlet var bannerIB :IMBanner?
    var banner: IMBanner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         * Code to integrate an InMobi banner programmatically.
         * Provide a frame to your banner according to your requirements.
         */
        banner = IMBanner(frame: CGRect(x:0, y:400, width:320, height:50),
                          placementId: INMOBI_BANNER_PLACEMENT);
        banner!.delegate = self;
        banner!.load()
        self.view.addSubview(self.banner!);
        
        /*
         * Code to integrate an InMobi banner via Interface Builder
         */
        
        bannerIB?.placementId = INMOBI_BANNER_PLACEMENT;
        bannerIB?.load();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /**
     * Notifies the delegate that the banner has finished loading
     */
    func bannerDidFinishLoading(_ banner: IMBanner) {
        print("******InMobi Banner finished loading");
    }
    
    /**
     * Notifies the delegate that the banner has failed to load with some error.
     */
    func banner(_ banner: IMBanner, didFailToLoadWithError error: IMRequestStatus) {
        print("InMobi Banner failed to load with error : %@", error);
    }
    
    /**
     * Notifies the delegate that the banner was interacted with.
     */
    func banner(_ banner: IMBanner, didInteractWithParams params: [String : Any]?) {
        print("InMobi Banner did interact with params : \(params  as AnyObject)");
    }
    
    /**
     * Notifies the delegate that the user would be taken out of the application context.
     */
    func userWillLeaveApplicationFromBanner(_ banner: IMBanner) {
        print("InMobi Banner will leave application");
    }
    
    /**
     * Notifies the delegate that the banner would be presenting a full screen content.
     */
    func bannerWillPresentScreen(_ banner: IMBanner) {
        print("InMobi Banner will present a screen");
    }
    
    /**
     * Notifies the delegate that the banner has finished presenting screen.
     */
    func bannerDidPresentScreen(_ banner: IMBanner) {
        print("InMobi Banner presented a screen");
    }
    
    /**
     * Notifies the delegate that the banner will start dismissing the presented screen.
     */
    func bannerWillDismissScreen(_ banner: IMBanner) {
        print("InMobi Banner will dismiss a presented screen");
    }
    
    /**
     * Notifies the delegate that the banner has dismissed the presented screen.
     */
    func bannerDidDismissScreen(_ banner: IMBanner) {
        print("InMobi Banner dismissed a presented screen");
    }
    
    /**
     * Notifies the delegate that the user has completed the action to be incentivised with.
     */
    func banner(_ banner: IMBanner, rewardActionCompletedWithRewards rewards: [String : Any]) {
        print("InMobi Banner completed a rewarded action. Rewards : \(rewards  as AnyObject)");
    }
    
    /**
     * Notifies the delegate that the banner ad impressed.
     */
    func bannerAdImpressed(_ banner: IMBanner) {
        print("InMobi Banner Ad Impressed");
    }
}

