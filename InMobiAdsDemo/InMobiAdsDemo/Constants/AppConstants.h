//
//  AppConstants.h
//  Ads Demo
//
//  Copyright (c) 2015 Inmobi. All rights reserved.
//

#ifndef Ads_Demo_AppConstants_h
#define Ads_Demo_AppConstants_h

#import "IMAppIds.h"


//#define INMOBI_NEWSFEED 1446094659438
//#define INMOBI_COVERFLOW 1444544814882
//#define INMOBI_BOARDVIEW 1446178457345
//#define INMOBI_FEEDS 1444208519758
//#define INMOBI_BANNER 1447912324502
//#define INMOBI_INTERSTITIAL 1446377525790


#define RGBToUIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

#define kScreen [[UIScreen mainScreen] bounds]
#define kScreenWidth CGRectGetWidth(kScreen)

#define kCellPadding 10.0
#define kGridAspectRatio (215.0/150.0)

#define kGridItemWidth ((kScreenWidth - (3 * kCellPadding)) / 2)
#define kGridItemHeight kGridItemWidth * kGridAspectRatio

#define kGridCellSize CGSizeMake (kGridItemWidth, kGridItemHeight)

#define NEWS_URL @"https://api.rss2json.com/v1/api.json?rss_url=http://rss.nytimes.com/services/xml/rss/nyt/World.xml"
#define FEED_URL @"https://api.rss2json.com/v1/api.json?rss_url=https://api.instagram.com/v1/users/595017071/media/recent?client_id=8ff39eb66c424c89ad26adfb0dd1ca2c"
#define BOARD_URL @"https://api.rss2json.com/v1/api.json?rss_url=http://rss.nytimes.com/services/xml/rss/nyt/World.xml"
#define PREROLL_URL @"https://i.l.inmobicdn.net/ifctpads/IFC/CCN/assets/KygoStoleTheShowfeat1492609018onlinevideocutter1492609592.mp4"

#endif
