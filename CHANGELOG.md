===================================
InMobi Monetization SDK for iOS
===================================

Build 10.1.3 [24/Feb/2023]
-------------
- Updated minimum supported version of Xcode to Xcode 14.0
- Removed support for bitcode which is deprecated in Xcode 14
- Removed support for iOS 9 & iOS 10
- Bug Fixes

Build 10.1.2 [18/Nov/2022]
-------------
- Audio Ads Support
- Bug Fixes

Build 10.1.1 [31/Oct/2022] 
-------------
- Improved contextual targeting support
- Bug Fixes

Build 10.1.0 [08/Sep/2022]
-------------
- Added Support for Variable Size SKStore
- Bug fixes

Build 10.0.8 [15/July/2022]
-------------
- Added Support for Publisher callback - AdImpressed
- Added Support for Contextual App Targeting
- New APIs Added
    IMBannerDelegate:
    + -(void)bannerAdImpressed:(IMBanner*)banner;  
    IMInterstitialDelegate:
    + -(void)interstitialAdImpressed:(IMInterstitial*)interstitial;
    
Build 10.0.7 [25/May/2022]
-------------
- Bug fixes

Build 10.0.6 [13/May/2022]
-------------
- Added Support for Dynamic Orientation
- Added Support for Custom Browser
- Improvements in ad response size and rendering
- Bug fixes

Build 10.0.5 [30/Mar/2022]
-------------
- Added Support for OnDevice Targeting
- Added Support for Family apps
- New APIs Added
    IMSDK
    + +(void)setIsAgeRestricted:(BOOL)isRestricted;
    IMODTargetingService
    + +(void)push:(NSString *)hashId;
- Bug fixes

Build 10.0.2 [21/Jan/2022]
-------------
- Updated minimum supported version of Xcode to Xcode 12.5
- Improvements in opening of landing page
- Updated License and ReadMe

Build 10.0.1 [19/Oct/2021]
-------------
- Bug fixes

Build 10.0.0 [30/Sep/2021]
-------------
- Added support for SKOverlay 
- Added support for M1 Mac Simulator
- Upgraded OMSDK  to v1.3.17
- New APIs Added
    IMBanner
    +  NSString* contentUrl;
    IMNative
    +  NSString* contentUrl;
    IMInterstitial
    +  NSString* contentUrl;
    
Build 9.2.1 [20/Aug/2021]
-------------
- Added support for Xcode 12.0.
- Support for Partner GDPR consent
- Bug fixes
- New APIs Added
    IMSDK
    + +(void)setPartnerGDPRConsent:(nullable NSDictionary *)consentDictionary;

Build 9.2.0 [16/July/2021]
-------------
- Updated minimum supported version of Xcode to Xcode 12.5
- SKAdNetwork 2.2 and 3.0 support
- Landing page opening management
- Native support for clicks and impression tracking
- Load with response support for Native Ads.
- Removed optional moat SDK
- Bug fixes
- New APIs Added
    IMNative
    + -(void)load:(NSData*)response;
    

Build 9.1.7 [01/April/2021]
-------------
- Updated minimum supported version of Xcode to Xcode 12.0
- Unified Id support
- AdPods support
- Bug Fixes
- New APIs Added
    IMSdk:
    + +(void)setPublisherProvidedUnifiedId:(NSDictionary*)ids;
    IMUnifiedIdService:
    + +(void)push:(nullable IMUserDataModel *)data;
    + +(void)reset;
    + +(void)fetchUnifiedIds:(id<IMUnifiedIdDelegate>)delegate;
    + +(void)enableDebugMode:(BOOL)debugMode;
    IMUnifiedIdDelegate:
    + -(void)onFetchCompleted:(nullable NSDictionary *)response error:(nullable NSError *)error;
    IMUserDataModel:
    + -(instancetype)initWithPhoneNumber:(nullable IMUserDataTypes *)phoneNumber emailId:(nullable IMUserDataTypes *)emailId extras:(nullable NSDictionary *)extras;
    IMUserDataTypes:
    + -(instancetype)initWithMd5:(nullable NSString *)md5 sha1:(nullable NSString *)sha1 sha256:(nullable NSString *)sha256;

Build 9.1.5 [11/Feb/2021]
-------------
- Added support for auto management of AVAudioSession for audio measurability in WKWebView
- New APIs Added;
    IMSdk:
    + +(NSString *)getToken; 
    + +(NSString *)getTokenWithExtras:(nullable NSDictionary*)extras andKeywords:(nullable NSString*)keywords;
    + +(void)shouldAutoManageAVAudioSesssion:(BOOL)value;
- Bug Fixes

Build 9.1.1 [11/Nov/2020]
-------------
- Added support for CMP-TCF v2
- Bug Fixes

Build 9.1.0 [23/Sep/2020]
-------------
- Added support for iOS 14
- Added support for SKAdNetwork
- Added support for App Tracking Transparency Framework
- Bug Fixes

Build 9.0.7 [24/Apr/2020]
-------------
- Added MAX Header Bidding Support
- Added MoPub Audience Bidding Support
- Added Custom Audience Bidding Support
- New APIs Added;
    IMBannerDelegate:
    + -(void)banner:(IMBanner*)banner gotSignals:(NSData*)signals;
    + -(void)banner:(IMBanner *)banner failedToGetSignalsWithError:(IMRequestStatus*)status;
    + -(void)banner:(IMBanner*)banner didReceiveWithMetaInfo:(IMAdMetaInfo*)info;
    + -(void)banner:(IMBanner*)banner didFailToReceiveWithError:(IMRequestStatus*)error;
    IMInterstitialDelegate:
    + -(void)interstitial:(IMInterstitial*)interstitial gotSignals:(NSData*)signals;
    + -(void)interstitial:(IMInterstitial*)interstitial failedToGetSignalsWithError:(IMRequestStatus*)status;
    + -(void)interstitial:(IMInterstitial*)interstitial didReceiveWithMetaInfo:(IMAdMetaInfo*)metaInfo;
    + -(void)interstitial:(IMInterstitial*)interstitial didFailToReceiveWithError:(NSError*)error;
    IMBannerPreloadManager:
    + -(void)preload;
    + -(void)load;
   IMInterstitialPreloadManager:
    + -(void)preload;
    + -(void)load;
   IMBanner:
   + - (void)getSignals;
   + - (void)load:(NSData*)response;
   + @property (nonatomic, strong, readonly) IMBannerPreloadManager* preloadManager;
   IMInterstitial:
   + - (void)getSignals;
   + -(void)load:(NSData*)response;
   + @property (nonatomic, strong, readonly) IMInterstitialPreloadManager* preloadManager;
   IMAdMetaInfo:
   + @property (nonatomic, strong, readonly) NSString* creativeID;
   + @property (nonatomic, strong, readonly) NSDictionary* bidInfo;
   + - (double)getBid;
- APIs Deprecated
    IMInterstitialDelegate:
        -(void)interstitialDidReceiveAd:(IMInterstitial*)interstitial;

Build 9.0.6 [03/Mar/2020]
-------------
- APIs Added
    * IMSdk Class
    + +(void)initWithAccountID:(NSString*)accountID andCompletionHandler:(void (^ _Nullable)( NSError * _Nullable )) completionBlock;
    + +(void)initWithAccountID:(NSString*)accountID consentDictionary:(nullable NSDictionary*) consentDictionary andCompletionHandler:(void (^ _Nullable)( NSError * _Nullable )) completionBlock;
- APIs Removed
    * IMSdk Class
    - +(void)initWithAccountID:(NSString*)accountID consentDictionary:(nullable NSDictionary*) consentDictionary andError:(NSError * _Nullable * _Nonnull)error;
    - +(void)initWithAccountID:(NSString *)accountID andError:(NSError * _Nullable * _Nonnull)error;
- Bug Fixes


Build 9.0.4 [21/Jan/2020]
-------------
- Deprecated "initWithAccountID:consentDictionary:" api of IMSdk.
- Added "initWithAccountID:consentDictionary:andError:" api to IMSdk. 
- Video support for Banner ad
- Improvement of fraud detection behaviour.
- Bug Fixes

Build 9.0.3 [10/Dec/2019]
-------------
- Bug Fixes

Build 9.0.2 [20/Nov/2019]
-------------
- Add ability to compile SDK on Xcode 10.2 onwards
- Bug Fixes

Build 9.0.1 [25/Oct/2019]
-------------
- Add support for IAB GDPR consent string
- Update OMSDK to v1.2.19
- Seperate Moat SDK from InMobi SDK and add as an optional dependency
- Completely remove UIWebView from the SDK
- Bug Fixes

Build 9.0.0 [20/Sept/2019]
-------------
- Changes to support iOS 13.
- New and improved Modularised SDK design.
  - Add InMobiMediationSDK.framework to your project for AerServ Mediation.
- SKStoreProductViewController crash fix.
- Removed Support for iOS 8. 
- Removed Support for AerServ Native ad format.
- Removed UIWebView from InMobi SDK. Viewability Partners might be using it.  
- Size reduction for both Framework and ipa inflation.
- Various Bug Fixes and performance improvements.

- Adapter updates for the following mediation partners:
        * MoPub            - v5.9.0
        * Google Mobile Ads - v7.50.0    
 
- APIs Added
    * IMBanner Class
     + -(void)cancel;
    * IMInterstitial Class
     + -(void)cancel;

- APIs Removed
    * ASAdView Class
     - @property (nonatomic, assign) ASEnvironmentType env;
     - @property (nonatomic, assign) ASPlatformType platform;
     - @property (nonatomic, assign) BOOL isMuted;
     - @property (nonatomic, assign) BOOL outlineAd;
     - @property (nonatomic, assign) BOOL sizeAdToFit;
     - @property (nonatomic, assign) BOOL useHeaderBidding;
     - @property (nonatomic, strong) NSArray* keyWords;
     - @property (nonatomic, assign) BOOL allowAdvertiserCloseButton;
     - -(void)forceRefreshAd;
     - -(CGSize)adContentSize;    
     - -(void)rotateToOrientation:(UIInterfaceOrientation)newOrientation;
      - -(void)play;
      - -(void)pause;

    * ASAdViewDelegate Protocol
      - -(void)willLeaveApplicatonFromAd:(ASAdView*)adView;
     - -(void)adSizeChanged:(ASAdView*)adView;
     - -(void)adView:(ASAdView*)adView didFireAdvertiserEventWithMessage:(NSString*)msg;

    * ASInterstitialViewController Class
     - @property (nonatomic, assign) ASEnvironmentType env;
     - @property (nonatomic, assign) ASPlatformType platform;
     - @property (nonatomic, assign) BOOL isMuted;
     - @property (nonatomic, assign) BOOL showOutline;
     - @property (nonatomic, assign) BOOL useHeaderBidding;
      - -(void)play;
      - -(void)pause;

    * ASInterstitialViewControllerDelegate Protocol
     - -(void)interstitialViewControllerAdInteraction:(ASInterstitialViewController*)viewController;
     - -(void)interstitialViewController:(ASInterstitialViewController*)viewController didFireAdvertiserEventWithMessage:(NSString*)msg;


Build 8.2.0 [16/July/2019]
-------------
- TRC Removal
- Caching Removal
- Mraid Viewable Defintion Change
- Bug fixes

Build 8.1.2 [16/July/2019]
-------------
- Audience bidding support for DFP
- SDK size Reduction
- New api to set slot size for Banner in Audience Bidding
- Bug fixes

Build 8.1.1 [13/June/2019]
-------------
- Adapter updates for the following mediation partners:
        * AdColony - 3.3.8
        * Facebook - 5.3.2
- Bug fixes

Build 8.1.0 [09/May/2019]
-------------
- Audience bidding support for AppNexus
- Added bid response support for Audience bidding
- Added DFP Custom Event support
- Bug fixes

Build 8.0.8 [17/April/2019]
-------------
- Addressing issue with layering of FAN banners upon refresh

Build 8.0.7 [09/April/2019]
-------------
- Audience bidding support for APS
- Additional support for higher granularity keywords

Build 8.0.5 [11/Mar/2019]
-------------
- Audience bidding support for MoPub
- Adapter updates for the following mediation partners:
    * AdColony - 3.3.6
    * AppLovin - 6.1.4
    * Chartboost - 7.3.0
    * Facebook - 5.1.0
    * Flurry - 9.2.3
    * MoPub - 5.4.1
    * MyTarget - 4.8.8
    * Vungle - 6.3.2
     * OneMobile AOL (Millennial Media) - 6.8.2
    * Vungle - 6.3.2
    * Unity - 3.0.0
- Deprecated Tremor support
- Deprecated Flurry banner support
- Added support for additional reporting for AppLovin and Chartboost
- Bug fixes
 
Build 8.0.2 [12/Dec/2018]
-------------
- Mediation bug fixes

Build 8.0.1 [21/Nov/2018]
-------------
- Added mediation support
- Bug fixes

Build 8.0.0 [17/Oct/2018]
-------------
- Added OMSDK support
- Unification of InMobi and AerServ SDK

Build 7.2.0 [11/Sep/2018]
-------------
- Support for iOS 12
- Block auto-redirection of ads without user interaction
- Bug Fixes

Build 7.1.5 [10/Aug/2018]
-------------
- Added callback for native ads on audio state change.
- Fixed issue with SKStore where both SKStore and AppStore were opening on user-click.
- Memory optimisation for banner ads.
- Main thread sanity for Native ads,
- Bug Fixes

- APIs Added
    * IMNative Class
     + -(void)native:(IMNative*)native adAudioStateChanged:(BOOL)audioState;

Build 7.1.2 [31/Jul/2018]
-------------
- Fixed a bug related to creative id api.

Build 7.1.1 [20/Apr/2018]
-------------
- Fixed a remote crash which can happen due to config update.

Build 7.1.0 [06/Apr/2018]
-------------

- Added support for GDPR compliance
- Added skip callback to Native Ads
- Removed support for iOS 7 devices. SDK will not initialise if the device is below iOS 8 [iOS 8 is deprecated as of v7.0.0]
- Fixed a crash in carousel ads
- Performance improvement by offloading certain tasks to the background threads
- Bug Fixes

- APIs Added
    * IMSDK class
     + +(void)initWithAccountID:(NSString *)accountID consentDictionary: (NSDictionary*) consentDictionary;
     + +(void) updateGDPRConsent:(NSDictionary *)consentDictionary;

    * IMCommonConstants class
     + #define IM_GDPR_CONSENT_AVAILABLE @"gdpr_consent_available"

    * IMNativeDelegate class
     + -(void)userDidSkipPlayingMediaFromNative:(IMNative*)native;

- APIs Removed
    * IMSDK class
     - +(void)setNationality:(NSString*)nationality
     - +(void)setEthnicity:(IMSDKEthnicity)ethnicity;
     - +(void)setHouseholdIncome:(IMSDKHouseholdIncome)income;
     - +(void)setIncome:(unsigned int)income;

    * IMCommonConstants class
     - -typedef NS_ENUM (NSInteger, IMSDKEthnicity) {
         kIMSDKEthnicityHispanic = 1,
             kIMSDKEthnicityCaucasian,
             kIMSDKEthnicityAsian,
             kIMSDKEthnicityAfricanAmerican,
             kIMSDKEthnicityOther
         };
 
     - -typedef NS_ENUM(NSInteger, IMSDKHouseholdIncome) {
             kIMSDKHouseholdIncomeBelow5kUSD = 1,
             kIMSDKHouseholdIncomeBetween5kAnd10kUSD,
             kIMSDKHouseholdIncomeBetween10kAnd15kUSD,
             kIMSDKHouseholdIncomeBetween15kAnd20kUSD,
             kIMSDKHouseholdIncomeBetween20kAnd25kUSD,
             kIMSDKHouseholdIncomeBetween25kAnd50kUSD,
             kIMSDKHouseholdIncomeBetween50kAnd75kUSD,
             kIMSDKHouseholdIncomeBetween75kAnd100kUSD,
             kIMSDKHouseholdIncomeBetween100kAnd150kUSD,
             kIMSDKHouseholdIncomeAbove150kUSD
         };

Build 7.0.5 [27/Dec/2017]
-------------
- Bug Fixes

Build 7.0.4 [1/Dec/2017]
-------------
- Support for iPhone X
- Bug Fixes

Build 7.0.3 [11/Nov/2017]
-------------
- Bug Fixes

Build 7.0.2 [10/Nov/2017]
-------------
- Bug Fixes & Performance Improvements

Build 7.0.1 [27/Sep/2017]
-------------
- Bug Fixes

Build 7.0.0 [15/Sept/2017]
-------------
Consolidated change-logs for v6.9.0, v6.9.1 and v6.9.2

- Bug Fixes
- Better Metrics collection
- Changes to support iOS 11
- Remove support for iOS 7
- Deprecating support for iOS 8
- Brand new Native Ad solution:
    * Native ads can now support videos, carousel and static Ad types
    * Prefetching Native Ads for better load times
    * Better way to customize the Ad to match the App’s native environment
- Interactive Video Ad Experience:
    * Brand new video Ad experience to increase user engagement in Interstitial Ad Format
- Rich End Cards:
    * Engaging end-cards are now supported via Rich-Media End-cards
- Support for GIF images
- Performance improvements

- APIs Added
    * IMNative class
     + -(UIView*)primaryViewOfWidth:(CGFloat)width;
     + @property (nonatomic, strong, readonly) NSString* customAdContent;
     + @property (nonatomic, strong, readonly) NSString* adTitle;
     + @property (nonatomic, strong, readonly) NSString* adDescription;
     + @property (nonatomic, strong, readonly) UIImage* adIcon;
     + @property (nonatomic, strong, readonly) NSString* adCtaText;
     + @property (nonatomic, strong, readonly) NSString* adRating;
     + @property (nonatomic, strong, readonly) NSURL* adLandingPageUrl;
     + @property (nonatomic, readonly) BOOL isAppDownload;
     + -(BOOL)isReady;
     + -(void)reportAdClickAndOpenLandingPage;


    * IMNativeDelegate
     + -(void)native:(IMNative*)native rewardActionCompletedWithRewards:(NSDictionary*)rewards;
     + -(void)native:(IMNative*)native didInteractWithParams:(NSDictionary*)params;
     + -(void)nativeDidFinishPlayingMedia:(IMNative*)native;

- APIs Removed
    * IMNativeStrands class
     + @interface IMNativeStrands : NSObject
     + @property (nonatomic, weak) id<IMNativeStrandsDelegate>delegate;
     + @property (nonatomic, strong) NSString* keywords;
     + @property (nonatomic, strong) NSDictionary* extras;
     + -(instancetype)initWithPlacementId:(long long)placementId position:(NSInteger)position;
     + -(instancetype)initWithPlacementId:(long long)placementId;
     + -(void)load;
     + -(UIView*)strandsView;
     + - (void)recycleView;
     + - (CGSize)strandsViewSize;

    * IMNativeStrandsDelegate protocol
     + @interface IMNativeStrands : NSObject
     + -(void)nativeStrandsDidFinishLoading:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrands:(IMNativeStrands*)nativeStrands didFailToLoadWithError:(IMRequestStatus*)error;
     + -(void)nativeStrandsWillPresentScreen:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrandsDidPresentScreen:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrandsWillDismissScreen:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrandsDidDismissScreen:(IMNativeStrands*)nativeStrands;
     + -(void)userWillLeaveApplicationFromNativeStrands:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrandsAdImpressed:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrandsAdClicked:(IMNativeStrands*)nativeStrands;

    * IMNative class
     + @property (nonatomic, strong, readonly) NSString* adContent;
     + +(void)bindNative:(IMNative*)native toView:(UIView*)view;
     + +(void)unBindView:(UIView*)view;
     + -(void)reportAdClick:(NSDictionary*)params;
     + -(void)reportAdClickAndOpenLandingURL:(NSDictionary*)params;


Build 6.8.1 [02/Jun/2017]
-------------
- Added Prefetching for Native Ads
- Bug Fixes

Build 6.2.1 [25/May/2017]
-------------
- Bug Fixes

Build 6.2.0 [21/Apr/2017]
-------------
- Bug Fixes

Build 6.1.2 [03/Mar/2017]
-------------
- Bug Fixes

Build 6.1.1 [14/Feb/2017]
-------------
- Bug Fixes

Build 6.1.0 [06/Feb/2017]
-------------
- Added support for in-feed video ads
- Fixed a typo in IMSDKHouseholdIncome enum
- Now Interstitial ad formats can have transparent background
- Bug Fixes

Build 6.0.1 [23/Nov/2016]
-------------
- Added Auto close support for Native Fullscreen ads
- Minor enhancements for customization in Video ads
- Crash in scrollable asset fixed
- Bug Fixes
- Removed dependencies on EventKit and EventKitUI frameworks

Build 6.0.0 [19/Sep/2016]
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
- A new delegate method introduced in IMInterstitialDelegate to indicate fetch completion of the ad.
- A new delegate method have been introduced in IMNative to indicate impression tracking of the ad view.
- Two new delegate methods have been introduced in IMNativeStrandsDelegate to indicate impression tracking of the ad view and click of the ad view.
- Removed support for IMStrandTableViewAdapter

- APIs Added
    * IMInterstitialDelegate
     + -(void)interstitialDidReceiveAd:(IMInterstitial *)interstitial;

    * IMNativeDelegate
     + -(void)nativeAdImpressed:(IMNative*)native;

    * IMNativeStrandsDelegate
     + -(void)nativeStrandsAdImpressed:(IMNativeStrands*)nativeStrands;
     + -(void)nativeStrandsAdClicked:(IMNativeStrands*)nativeStrands;

- APIs Removed
    * IMStrandTableViewAdapter class
     + @interface IMStrandTableViewAdapter : NSObject
     + @property (nonatomic, weak) id <IMStrandTableViewAdapterDelegate> delegate;
     + @property (nonatomic, strong) NSString* keywords;
     + @property (nonatomic, strong) NSDictionary* extras;
     + + (instancetype)adapterWithTableView:(UITableView *)tableView placementId:(long long)placementId adPositioning:(IMStrandPosition *)positioning tableViewCellClass:(Class)tableViewCellClass;
     + - (void)load;
     + - (void) clearAds;

    * UITableView (IMStrandTableViewAdapter) category
     + - (void)im_setStrandAdapter:(IMStrandTableViewAdapter *)adapter;
     + - (IMStrandTableViewAdapter *)im_strandAdapter;
     + - (void)im_setDataSource:(id<UITableViewDataSource>)dataSource;
     + - (id<UITableViewDataSource>)im_dataSource;
     + - (void)im_setDelegate:(id<UITableViewDelegate>)delegate;
     + - (id<UITableViewDelegate>)im_delegate;
     + - (void)im_beginUpdates;
     + - (void)im_endUpdates;
     + - (void)im_reloadData;
     + - (void)im_insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;
     + - (void)im_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_moveSection:(NSInteger)section toSection:(NSInteger)newSection;
     + - (UITableViewCell *)im_cellForRowAtIndexPath:(NSIndexPath *)indexPath;
     + - (id)im_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
     + - (void)im_deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;
     + - (NSIndexPath *)im_indexPathForCell:(UITableViewCell *)cell;
     + - (NSIndexPath *)im_indexPathForRowAtPoint:(CGPoint)point;
     + - (NSIndexPath *)im_indexPathForSelectedRow;
     + - (NSArray *)im_indexPathsForRowsInRect:(CGRect)rect;
     + - (NSArray *)im_indexPathsForSelectedRows;
     + - (NSArray *)im_indexPathsForVisibleRows;
     + - (CGRect)im_rectForRowAtIndexPath:(NSIndexPath *)indexPath;
     + - (void)im_scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
     + - (void)im_selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
     + - (NSArray *)im_visibleCells;

Build 5.3.2 [12/Aug/2016]
-------------
- Crash fix in Native Strands.

Build 5.3.1 [16/May/2016]
-------------
- SDK now takes the location information only when the publisher has taken the permissions from the user.
- Minor Bug Fixes

Build 5.3.0 [11/Apr/2016]
-------------
- A new Ad Format Native Strands is added.
- Minor Bug Fixes
- APIs Added
    * IMStrandPosition class
     + @property (nonatomic, strong, readonly) NSMutableOrderedSet *fixedPositions;
     + @property (nonatomic, assign, readonly) NSUInteger stride;
     + + (instancetype)positioning;
     + - (void)addFixedIndexPath:(NSIndexPath *)indexPath;
     + - (void)enableRepeatingPositionsWithStride:(NSUInteger)stride;
     
    * IMNativeStrands Class
     + @property (nonatomic, weak) id<IMNativeStrandsDelegate> delegate
     + @property (nonatomic, strong) NSString *keywords
     + @property (nonatomic, strong) NSDictionary *extras
     + - (instancetype)initWithPlacementId:(long long)placementId position:(NSInteger)position
     + - (instancetype)initWithPlacementId:(long long)placementId
     + - (void)load
     + - (UIView *)strandsView
     + - (void)recycleView
     + - (CGSize)strandsViewSize
     
    * IMStrandTableViewAdapter class
     + @interface IMStrandTableViewAdapter : NSObject
     + @property (nonatomic, weak) id <IMStrandTableViewAdapterDelegate> delegate;
     + @property (nonatomic, strong) NSString* keywords;
     + @property (nonatomic, strong) NSDictionary* extras;
     + + (instancetype)adapterWithTableView:(UITableView *)tableView placementId:(long long)placementId adPositioning:(IMStrandPosition *)positioning tableViewCellClass:(Class)tableViewCellClass;
     + - (void)load;
     + - (void) clearAds;

    * UITableView (IMStrandTableViewAdapter) category
     + - (void)im_setStrandAdapter:(IMStrandTableViewAdapter *)adapter;
     + - (IMStrandTableViewAdapter *)im_strandAdapter;
     + - (void)im_setDataSource:(id<UITableViewDataSource>)dataSource;
     + - (id<UITableViewDataSource>)im_dataSource;
     + - (void)im_setDelegate:(id<UITableViewDelegate>)delegate;
     + - (id<UITableViewDelegate>)im_delegate;
     + - (void)im_beginUpdates;
     + - (void)im_endUpdates;
     + - (void)im_reloadData;
     + - (void)im_insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;
     + - (void)im_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
     + - (void)im_moveSection:(NSInteger)section toSection:(NSInteger)newSection;
     + - (UITableViewCell *)im_cellForRowAtIndexPath:(NSIndexPath *)indexPath;
     + - (id)im_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
     + - (void)im_deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;
     + - (NSIndexPath *)im_indexPathForCell:(UITableViewCell *)cell;
     + - (NSIndexPath *)im_indexPathForRowAtPoint:(CGPoint)point;
     + - (NSIndexPath *)im_indexPathForSelectedRow;
     + - (NSArray *)im_indexPathsForRowsInRect:(CGRect)rect;
     + - (NSArray *)im_indexPathsForSelectedRows;
     + - (NSArray *)im_indexPathsForVisibleRows;
     + - (CGRect)im_rectForRowAtIndexPath:(NSIndexPath *)indexPath;
     + - (void)im_scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
     + - (void)im_selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
     + - (NSArray *)im_visibleCells;

Build 5.2.1 [24/Feb/2016]
-------------
- Fix namespace conflicts by creating a single master object file.
- Bug fixed in Native Ads for detecting potential fraud.
- Minor Bug Fixes

Build 5.2.0 [20/Jan/2016]
-------------
- Detect potential fraud from auto-redirecting ads.
- Minor Bug Fixes

Build 5.1.2 [04/Jan/2016]
-------------
- Minor Bug Fixes

Build 5.1.1 [21/Dec/2015]
-------------
- Fixed crash related to -[IMRenderView canProcessURL:]
- Minor Bug Fixes

Build 5.1.0 [19/Nov/2015]
-------------
- Improved video ads performance
- Removed support for iOS 6
- Minor Bug Fixes

Build 5.0.2 [27/Oct/2015]
-------------
- Fixed issues related to building with the -all_load flag
- Minor bug fixes

Build 5.0.1 [05/Oct/2015]
-------------
- Fixed Bitcode Support
- Updated the deployment target to correctly build on iOS 6.0
- Minor bug fixes

Build 5.0.0 [23/Sept/2015]
-------------
- Support for iOS 9 added
- Bitcode enabled SDK
- Support for Crash Reporting added
- Deprecated support for iOS 6
- Removed support for iOS 5
- Mandatory time interval of 20s between successive ad loads
- SKStore user experience enhancements
- Analytics support removed
- Minor Bug Fixes
- APIs added
    * IMSdk class
      + (void)setAgeGroup:(IMSDKAgeGroup)ageGroup
      + (void)setYearOfBirth:(NSInteger)yearOfBirth
      + (void)setHouseholdIncome:(IMSDKHouseholdIncome)income
          + (void)setNationality:(NSString*)nationality
    * IMBanner class
      @property (nonatomic, strong) NSDictionary* extras
      - (instancetype)initWithFrame:(CGRect)frame placementId:(long long)placementId delegate:(id<IMBannerDelegate>)delegate
      - (void)setRefreshInterval:(NSInteger)interval
      - (void)shouldAutoRefresh:(BOOL)refresh
    * IMInterstitial class
     @property (nonatomic, strong) NSDictionary* extras
     - (instancetype)initWithPlacementId:(long long)placementId delegate:(id<IMInterstitialDelegate>)delegate
     - (BOOL)isReady
     - (void)showFromViewController:(UIViewController *)viewController
    * IMNative class
      @property (nonatomic, strong) NSDictionary* extras
      - (instancetype)initWithPlacementId:(long long)placementId delegate:(id<IMNativeDelegate>)delegate
      - (void)reportAdClickAndOpenLandingURL:(NSDictionary *)params
    * IMCustomNative class
      + (void)bindNative:(IMNative*)native toView:(UIView *)view withImpressionTrackerScript:(NSString*)impressionTracker;
      + (void)bindNative:(IMNative*)native toView:(UIView *)view withImpressionTrackerURL:(NSURL*)impressionTrackerURL
      - (void)reportAdClick:(NSDictionary*)extras withCustomClickTrackerScript:(NSString*)clickTracker;
      - (void)reportAdClick:(NSDictionary*)extras withCustomClickTrackerURL:(NSURL*)clickTrackerURL;
      - (void)reportAdClickAndOpenLandingURL:(NSDictionary*)extras withCustomClickTrackerScript:(NSString*)clickTracker;
      - (void)reportAdClickAndOpenLandingURL:(NSDictionary*)extras withCustomClickTrackerURL:(NSURL*)clickTrackerURL;
    * IMRequestStatus class
      - (instancetype)initWithDomain:(NSString *)domain code:(IMStatusCode)code userInfo:(NSDictionary *)dict
    * IMBannerDelegate class
      - (void)bannerDidPresentScreen:(IMBanner *)banner
      - (void)banner:(IMBanner *)banner rewardActionCompletedWithRewards:(NSDictionary *)rewards
    * IMInterstitialDelegate class
      - (void)interstitial:(IMInterstitial *)interstitial rewardActionCompletedWithRewards:(NSDictionary *)rewards
      - (void)interstitialDidPresent:(IMInterstitial *)interstitial
    * IMNativeDelegate class
      - (void)nativeDidDismissScreen:(IMNative *)native
      - (void)nativeDidPresentScreen:(IMNative *)native
      - (void)nativeWillDismissScreen:(IMNative *)native
      - (void)nativeWillPresentScreen:(IMNative *)native
      - (void)userWillLeaveApplicationFromNative:(IMNative *)native
- APIs updated
    * Moved APIs from InMobi class to IMSdk
    * IMSdk Class
          + (void)initialize:(NSString *)publisherAppId
          updated to + (void)initWithAccountID:(NSString *)accountID

      + (void)setLocationWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude accuracy:(CGFloat)accuracyInMeters
          updated to +(void)setLocation:(CLLocation*)location

      + (void)setLogLevel:(IMLogLevel)logLevel
          updated to +(void)setLogLevel:(IMSDKLogLevel)desiredLogLevel

          + (void)addUserID:(IMUserId)userId withValue:(NSString *)idValue
          updated to +(void)addId:(NSString*)identifier forType:(IMSDKIdType)type

      + (void)removeUserID:(IMUserId)userId
          updated to +(void)removeIdType:(IMSDKIdType)type

    * IMBanner Class
          @property (nonatomic, copy) NSString *appId
          updated to @property (nonatomic) long long placementId

          @property (nonatomic, assign) UIViewAnimationTransition refreshAnimation
      updated to @property (nonatomic) UIViewAnimationTransition transitionAnimation

      - (id)initWithFrame:(CGRect)frame appId:(NSString *)appId adSize:(int)adSize
      updated to - (instancetype)initWithFrame:(CGRect)frame placementId:(long long)placementId

      - (void)loadBanner
      updated to - (void)load

    * IMInterstitial Class

          - (id)initWithAppId:(NSString *)appId
          updated to - (instancetype)initWithPlacementId:(long long)placementId

      - (void)loadInterstitial
          updated to - (void)load

          - (void)presentInterstitialAnimated:(BOOL)animated
          updated to - (void)showFromViewController:(UIViewController *)viewController withAnimation:(IMInterstitialAnimationType)type

    * IMNative Class
      @property (atomic, strong) NSString *content
      updated to @property (nonatomic, strong, readonly) NSString *adContent

      - (id)initWithAppId:(NSString *)appId
          updated to - (instancetype)initWithPlacementId:(long long)placementId

      - (void)attachToView:(UIView *)view
      updated to + (void)bindNative:(IMNative*)native toView:(UIView*)view

      - (void)detachFromView
      updated to + (void)unBindView:(UIView*)view

      - (void)handleClick:(NSDictionary *)params
          updated to - (void)reportAdClick:(NSDictionary *)params

      - (void)loadAd
      updated to - (void)load

    * IMBannerDelegate class
      - (void)banner:(IMBanner *)banner didFailToReceiveAdWithError:(IMError *)error
          updated to - (void)banner:(IMBanner *)banner didFailToLoadWithError:(IMRequestStatus *)error

      - (void)bannerDidInteract:(IMBanner *)banner withParams:(NSDictionary *)dictionary
          updated to - (void)banner:(IMBanner *)banner didInteractWithParams:(NSDictionary *)params

      - (void)bannerDidReceiveAd:(IMBanner *)banner
          updated to - (void)bannerDidFinishLoading:(IMBanner *)banner

      - (void)bannerWillLeaveApplication:(IMBanner *)banner
          updated to - (void)userWillLeaveApplicationFromBanner:(IMBanner *)banner

    * IMInterstitialDelegate Class
      - (void)interstitial:(IMInterstitial *)ad didFailToPresentScreenWithError:(IMError *)error
          updated to - (void)interstitial:(IMInterstitial *)interstitial didFailToPresentWithError:(IMRequestStatus *)error

      - (void)interstitial:(IMInterstitial *)ad didFailToReceiveAdWithError:(IMError *)error
          updated to - (void)interstitial:(IMInterstitial *)interstitial didFailToLoadWithError:(IMRequestStatus *)error

      - (void)interstitialDidDismissScreen:(IMInterstitial *)ad
          updated to - (void)interstitialDidDismiss:(IMInterstitial *)interstitial

      - (void)interstitialDidInteract:(IMInterstitial *)ad withParams:(NSDictionary *)dictionary
          updated to - (void)interstitial:(IMInterstitial *)interstitial didInteractWithParams:(NSDictionary *)params

      - (void)interstitialDidReceiveAd:(IMInterstitial *)ad
          updated to - (void)interstitialDidFinishLoading:(IMInterstitial *)interstitial

      - (void)interstitialWillDismissScreen:(IMInterstitial *)ad
          updated to - (void)interstitialWillDismiss:(IMInterstitial *)interstitial

      - (void)interstitialWillLeaveApplication:(IMInterstitial *)ad
          updated to - (void)userWillLeaveApplicationFromInterstitial:(IMInterstitial *)interstitial

      - (void)interstitialWillPresentScreen:(IMInterstitial *)ad
          updated to - (void)interstitialWillPresent:(IMInterstitial *)interstitial

    * IMNativeDelegate class
      - (void)nativeAd:(IMNative *)native didFailWithError:(IMError *)error
          updated to - (void)native:(IMNative *)native didFailToLoadWithError:(IMRequestStatus *)error

      - (void)nativeAdDidFinishLoading:(IMNative *)native
          updated to - (void)nativeDidFinishLoading:(IMNative *)native

- APIs removed

    * IMSDK class
      + (void)setDeviceIdMask:(IMSDKDeviceIdMask)mask
      + (void)setDateOfBirth:(NSDate *)dateOfBirth
      + (void)setDateOfBirthWithMonth:(NSUInteger)month day:(NSUInteger)day year:(NSUInteger)year
      + (void)setSexualOrientation:(IMSexualOrientation)sexualOrientation
      + (void)setHasChildren:(IMHasChildren)children
      + (void)setMaritalStatus:(IMMaritalStatus)status
    * IMBanner class
      @property (nonatomic) int adSize
          @property (nonatomic) long long slotId
      @property (nonatomic, strong) NSString* refTagKey
      @property (nonatomic, strong) NSString* refTagVal
      @property (nonatomic, strong) NSDictionary *additionaParameters
          - (id)initWithFrame:(CGRect)frame slotId:(long long)slotId
      - (void)stopLoading
     * IMInterstitial class
      @property (nonatomic, strong) NSDictionary *additionaParameters
      @property (nonatomic, copy) NSString *appId
      @property (nonatomic) long long slotId
      @property (nonatomic, weak) NSObject<IMIncentivisedDelegate> *incentivisedDelegate
      @property (readonly) IMInterstitialState state
      - (id)initWithSlotId:(long long)slotId
      - (void)stopLoading
      * IMNative class
      @property (nonatomic, strong) NSString* refTagKey
      @property (nonatomic, strong) NSString* refTagVal
      @property (nonatomic, strong) NSDictionary *additionaParameters
     * IMIncentivisedDelegate class
     * IMError class
     * InMobiAnalytics class

Build 4.5.3 [13/May/2015]
-------------
- Minor bug fixes

Build 4.5.2 [24/Sep/2014]
-------------
- Minor bug fixes

Build 4.5.1 [16/Sep/2014]
-------------
- Minor bug fixes

Build 4.5.0 [13/Sep/2014]
-------------
- Support for iOS 8
- Support for attribute API
- Location based enhancements
- Dropping support for iOS 4.3
- Other minor bug fixes

Build 4.4.1 [09/July/2014]
-------------
- Fix for SKStore issue
- Other minor bug fixes

Build 4.4.0 [17/June/2014]
-------------
- Mraid enhancements for orientation lock
- Introduced Video instant play capability
- Minor Bug fixes

Build 4.3.0 [28/Apr/2014]
-------------
- Deprecating support for iOS 4.3
- MRAID enhancements
    * Added support for Calendar Events. Requires EventKit.framework and EventKitUI.framework to be added.
- Reward Ads support
- Security related improvements
- Including Sample App for Native Ads
- Minor Bug fixes


Build 4.1.0 [23/Dec/2013]
-------------
- Support for Native ads
- Hang fix for InApp store in iOS 6
- Minor bug fixes.

Build 4.0.4 [22/Nov/2013]
-------------
- Minor fix for call click to action.
- Minor bug fixes.

Build 4.0.3 [29/Oct/2013]
-------------
- 64 bit compatible.
- Other minor bug fixes.

Build 4.0.2 [10/Sept/2013]
-----------
- Minor bug fixes.

Build 4.0.1 [30/Aug/2013]
-----------
- Fixed a crash scenario when releasing the Banner instance at ad failure callback.
- Other minor bug fixes.

Build 4.0.0 [23/Aug/2013]
-----------
- iOS 7 compliant.
- Supports new innovative ad formats.
- Built in Analytics.
- Supports user Segmentation and Cross promotion.

Build 3.7.0 [15/Apr/2013]
-----------
- MRAID 2.0 support added.
- Added "https" support.
- Removed NSURLCache.
- Introduced transparent interstitial ad.
- Added SKStoreProductViewController for in-app context downloads.
- Device uniqueIdentifier (UDID) is no longer being collected.
- Added Frameworks
    * StoreKit
    * AudioToolBox
- Optional Frameworks
(Add these frameworks to provide additional capabilities for rich user experience.)
    * Social
- APIs added
    * IMAdInterstitial:
         @property(nonatomic,assign) IMAdMode adMode;
         - (id)initWithAppId:(NSString *)appId slotId:(long long)slotId;
         - (void)presentInterstitialAnimated:(BOOL)animated;
    * IMAdView:
        - (id)initWithFrame:(CGRect)frame
          imAppId:(NSString *)appId
          imAdSize:(int)adSize
          imSlotId:(long long)slotId;
- APIs deprecated
    * IMAdInterstitial:
         - (void)presentFromRootViewController:(UIViewController *)rootViewController
            animated:(BOOL)_animated;
    * IMAdView:
        @property (nonatomic, assign) UIViewController *rootViewController;
        - (id)initWithFrame:(CGRect)frame
            imAppId:(NSString *)appId
            imAdSize:(int)adSize rootViewController:(UIViewController *)viewController;
        - (void)setAdTextColor:(NSString *)color;
        - (void)setAdBackgroundColor:(NSString *)bgcolor;
        - (void)setAdBackgroundGradientWithTopColor:(NSString *)topcolor
            bottomColor:(NSString *)bottomcolor;
        - (BOOL)shouldRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation;
    * IMAdRequest:
        @property (nonatomic, assign) BOOL testMode;

Build 3.6.5 [10/Jan/2013]
-----------
- Removed dependencies on the '''PassKit''' framework.

Build 3.6.4 [07/Dec/2012]
-----------
- Fixed minor issues with NSURLCache.

Build 3.6.3 [07/Nov/2012]
-----------
- Fixed minor issues.
- Passing hashed UDID with this release. Added option to easily disable any Device ID using Device ID collection masks.

Build 3.6.2 [23/Oct/2012]
-----------
- Fixed minor issues.

Build 3.6.1 [12/Oct/2012]
-----------
- Fixed minor issues.
- Bug fixes.

Build 3.6.0 [15/Sep/2012]
-----------
- iOS 6 support added.
- CoreLocation framework dependency removed.
- CoreTelephony, AdSupport, and PassKit frameworks dependency added.
- Introduction of InMobiCommons SDK. InMobiAdNetwork SDK has dependency on InMobiCommons SDK. Both should be included in the project as mentioned in the integration guidelines. Ensure that the InMobiAdNetwork and InMobiCommons libraries are from the latest release bundle. Refer to Apple documentation on the API exposed.
-API Changes
    * Class Added
        IMCommonUtil
    * Properties and Methods Added
        IMCommonUtil.h
        + (void)setLogLevel:(IMLogLevelType)logLevel;
        + (IMLogLevelType)getLogLevel;
        + (void)setDeviceIdMask:(IMDeviceIdMask)deviceIdMask;
        + (IMDeviceIdMask)getDeviceIdMask;
        + (NSString *)getReleaseVersion;

         IMAdView.h
        @property (nonatomic, assign) int imAdSize;
        @property (nonatomic, assign) long long imSlotId;
        @property (nonatomic, assign) UIViewAnimationTransition refreshAnimation;
        - (id)initWithFrame:(CGRect)frame imAppId:(NSString *)appId imSlotId:(long long)slotId imAdSize:(int)adSize rootViewController:(UIViewController *)viewController;
        - (void)stopLoading;

         IMAdInterstitial.h
        @property (nonatomic, assign) long long imSlotId;
        - (void)stopLoading;

         IMAdRequest.h
        - (void)setDateOfBirthWithMonth:(NSUInteger)m day:(NSUInteger)d year:(NSUInteger)y;
        - (void)setLocationWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude accuracy:(CGFloat)accuracyInMeters;
    * Class Removed
        IMSDKUtil
    * Properties and Methods Removed
        IMAdView.h
        @property (nonatomic, assign) int imAdUnit;
        @property (nonatomic, assign) int animationType;
    * Properties and Methods Modified
        Logging methods moved from IMSDKUtil to the IMCommonUtil class.
        IMDeviceIdMask moved from IMAdRequest to the IMCommonUtil class.
    * New Error Codes Introduced in IMAdError.h
         kIMAdNetworkFetchTimedOut - When the ad fetch time is more than 1 minute.
        kIMAdNetworkRenderingTimedOut - When the ad rendering time is more than 1 minute.

Build 3.5.7 [31/Jul/2012]
-----------
- Included the slotId parameter.

Build 3.5.4 [07/Jun/2012]
-----------
- Fixed minor issues occurring during MRAID events.

Build 3.5.3 [30/May/2012]
-----------
- Included the uniqueIdentifier property of the device as a part of the ad request. In compliance with the relevant iOS policies, before using this version, Publishers must obtain user consent for sending device identifier information.

Build 3.5.2 [15/May/2012]
-----------
- Fixed earlier issue of a UIScrollView not scrolling to top when creating an instance of IMAdView.
- Fixed minor issues in the IMSDKUtil class.
- Fixed minor issues occurring during beaconing events.

Build 3.5.1 [24/Apr/2012]
-----------
- Fixed minor issues occurring while refreshing an expanded ad.

Build 3.5.0 [11/Apr/2012] Beta [30/Mar/2012]
-----------
- The uniqueIdentifier property of UIDevice class is no longer used.
- Fixed earlier multiple redirection issues.
- Fixed crash in IMAdRequest class.
- Fixed issue of app tracker callback going to internal URL.
- Fixed alignment issues of expanded ads.
- Removed the Core Location framework from the SDK. Core Location is no longer a mandatory framework required to link with SDK i350.
- Added 'MediaPlayer', 'Security', and 'AVFoundation' frameworks to SDK i350.
- API added
    * IMAdView.h
        - (BOOL)shouldRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation;
    * IMAdRequest.h
        typedef enum
        {
            ID_LOGIN,
            ID_SESSION
        } IMIDType;

         typedef enum
        {
            DeviceID_NONE   = 1 << 0,
            DeviceID_ODIN1  = 1 << 1
        } DeviceIDMask;
        @property (nonatomic,assign) CLLocation *location;
        @property (nonatomic, copy) NSString *loginID;
        @property (nonatomic, copy) NSString *sessionID;
        - (void)setLocationWithCity:(NSString *)_city state:(NSString *)_state country:(NSString *)_country;
        - (void) addIDType:(IDType)idType withValue: (NSString *)value;
- Properties Removed
    * IMAdRequest.h
        @property (nonatomic, assign) BOOL isLocationEnquiryAllowed;

Build 3.0.2 [21/Sep/2011]
-----------
- Suppressed location update requests in IMAdView's constructor.
- Fixed minor issue in IMAdView's loadIMAdRequest: method.
- Fixed linker errors for the IMReachabilityPrivate class.

Build 3.0.1 [16/Sep/2011]
-----------
- Fixed ad alignment issues.
- Fixed a minor memory leak issue.

Build 3.0.0 [08/Sep/2011]
-----------
