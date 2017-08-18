## Synopsis

Publicly available sample apps of InMobi providing simple integration steps. InMobi will add the latest SDK along with the change logs for the release.

## Installation steps for iOS Apps 

The following environment is required to run the Sample apps

    Xcode 8.0 
    InMobi SDK 6.x
    iOS 8.0 and above
	
Four sample apps are provided as per Ad Formats

	BannerSample
	InterstitialSample 
	NativeSample 
	NativeStrandsSample

The latest InMobi iOS SDK is available in the InMobi folder along with its change logs.

To run the sample apps, open any of the Ad Format's .xcodeproj file with Xcode 8.x. For example, to run a Banner's sample, open the BannerSample.xcodeproj in the BannerSample folder and run via Xcode.

## License

These sample apps are provided under MIT license. For more information, please see the LICENSE file. For information about InMobi SDK's license, please see the InMobi folder.

## Change logs

###Build 6.1.2 [03/Mar/2017]
-------------
- Bug Fixes

###Build 6.1.1 [14/Feb/2017]
-------------
- Bug Fixes

###Build 6.1.0 [06/Feb/2017]
-------------
- Added support for in-feed video ads
- Fixed a typo in IMSDKHouseholdIncome enum
- Now Interstitial ad formats can have transparent background
- Bug Fixes

###Build 6.0.1 [23/Nov/2016]
-------------
- Added Auto close support for Native Fullscreen ads
- Minor enhancements for customization in Video ads
- Crash in scrollable asset fixed
- Bug Fixes
- Removed dependencies on EventKit and EventKitUI frameworks

###Build 6.0.0 [19/Sep/2016]
-------------
- Fully compliant with iOS 10
- Deprecating support for iOS 7
- Integrates as a drag-drop replacement framework
- Added support for WKWebview
- Brand new video solution:
	* Drag-drop library upgrade for existing SDK 5xx.
	* High render rates
	* Stall free video experience
	* No Java Script
	* Enormous data savings for users
	* Better security and monetization
- Added support for easier integration.
- Added support for better debugging.
- Support for IPV6.
- Bug fixes
	* Fixed an issue where the Interstitial Ad disappears
	* Fixed an issue where the endcard doesn't show in some cases for fullscreen Native Video.
- A new delegate method introduced in IMInterstitialDelegate to indicate fetch completion of the ad.
- A new delegate method have been introduced in IMNative to indicate impression tracking of the ad view.
- Two new delegate methods have been introduced in IMNativeStrandsDelegate to indicate impression tracking of the ad view and click of the ad view.
- Removed support for IMStrandTableViewAdapter