//
//  ViewController.swift
//  NativeSwiftSample
//
//  Copyright © 2016 InMobi. All rights reserved.
//
import InMobiSDK.IMNative
import InMobiSDK.IMNativeDelegate


let INMOBI_NATIVE_PLACEMENT: Int64 = 1447912324502

import UIKit
import CoreFoundation

class ViewController: UIViewController, IMNativeDelegate {

    var native: IMNative?
    var image: UIImage?
    var nativeView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        native = IMNative(placementId: INMOBI_NATIVE_PLACEMENT, delegate: self);
        native?.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     * Notifies the delegate that the native ad has finished loading
     */
     func nativeDidFinishLoading(_ native: IMNative!) {
        NSLog("InMobi Native ad did finish loading");
        self.parseNativeContent(nativeContent: native.adContent! as NSString)
    }
    
    /**
     * Notifies the delegate that the native ad has failed to load with error.
     */
     func native(_ native: IMNative!, didFailToLoadWithError error: IMRequestStatus!) {
        NSLog("InMobi Native ad failed to load with error : %@", error);
    }
    
    /**
     * Notifies the delegate that the native ad would be presenting a full screen content.
     */
     func nativeWillPresentScreen(_ native: IMNative!) {
        NSLog("InMobi Native ad will present a screen");
    }
    
    /**
     * Notifies the delegate that the native ad has presented a full screen content.
     */
     func nativeDidPresentScreen(_ native: IMNative!) {
        NSLog("InMobi Native ad has presented a screen");
    }
    
    /**
     * Notifies the delegate that the native ad would be dismissing the presented full screen content.
     */
     func nativeWillDismissScreen(_ native: IMNative!) {
        NSLog("InMobi Native ad will dismiss a presented screen");
    }
    
    /**
     * Notifies the delegate that the native ad has dismissed the presented full screen content.
     */
     func nativeDidDismissScreen(_ native: IMNative!) {
        NSLog("InMobi Native ad dismissed a presented screen");
    }
    
    /**
     * Notifies the delegate that the user will be taken outside the application context.
     */
     func userWillLeaveApplication(from native: IMNative!) {
        NSLog("User will leave the application from an InMobi Native ad");
    }
    
    /**
     * Notifies the delegate that the nativeStrands ad impression has been tracked
     */
     func nativeAdImpressed(_ native: IMNative!) {
        NSLog("InMobi Native ad has tracked an impression");
    }
    
    //MARK: Native ad parsing methods
    
    func parseNativeContent(nativeContent: NSString) {
        
        let data:NSData? = nativeContent.data(using: String.Encoding.utf8.rawValue) as NSData?
        
        if data==nil {
            return
        }
        
        var nativeJsonDict: NSDictionary? = nil;
        do {
            nativeJsonDict = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableLeaves) as? NSDictionary
        } catch  {
            return;
        }

        if nativeJsonDict != nil {
            
            let iconDict: NSDictionary? = nativeJsonDict?["icon_xhdpi"] as? NSDictionary
            let iconUrlString: NSString? = iconDict?["url"] as? NSString
            if iconUrlString == nil {
                return
            }
            let iconURL: URL? = URL(string: iconUrlString! as String)
            if iconURL == nil {
                return
            }
            
            DispatchQueue.global().async {
                var iconImgData: NSData?
                do {
                    iconImgData? = try NSData(contentsOf: iconURL!, options: NSData.ReadingOptions.uncached);
                } catch {
                    return;
                }
                
                if iconImgData == nil {
                    self.image = nil;
                } else {
                    self.image = UIImage(data: iconImgData as! Data)
                }

                self.buildNativeView()
            }
        }
    }
    
    func buildNativeView() {
        DispatchQueue.main.async {
            self.nativeView = UIView(frame: CGRect(x: 0, y: 50, width: 320, height: 50))
            
            //Build the icon
            let iconView: UIImageView? = UIImageView(image: self.image)
            iconView?.frame = CGRect(x: 1, y: 1, width: 48, height: 48)
            iconView?.image = self.image;
            
            self.nativeView?.addSubview(iconView!)

            //Add the sponsered tag
            let sponsoredTag: UILabel? = UILabel(frame: CGRect(x: 280, y: 1, width: 40, height: 10))
            sponsoredTag?.text = "Sponsored";
            sponsoredTag?.textColor = UIColor.lightGray
            sponsoredTag?.font = UIFont.systemFont(ofSize: 6)
            
            self.nativeView?.addSubview(sponsoredTag!)

            //Add the CTA Button
            let ctaButton: UIButton? = UIButton(type: UIButtonType.custom)
            
            ctaButton?.frame = CGRect(x: 52, y: 1, width: 100, height: 48)
            
            ctaButton?.addTarget(self, action: #selector(self.ctaButtonClicked), for: UIControlEvents.touchUpInside)

            ctaButton?.setTitle("Click Me!!", for: UIControlState.normal);
            
            self.nativeView?.addSubview(sponsoredTag!)
            
            self.nativeView?.addSubview(ctaButton!)

            //Add the ad to the view controller
            self.view.addSubview(self.nativeView!)

            //IMP: Bind the Native ad to this view
            IMNative.bindNative(self.native, to: self.nativeView!)
        }
    }
    
    func ctaButtonClicked() {
        self.native?.reportAdClickAndOpenLandingURL(nil)
        
        //IMP: Remove the ad and call unbind
        IMNative.unBindView(self.nativeView)
        self.nativeView?.removeFromSuperview()
        self.native?.load()
    }

}

