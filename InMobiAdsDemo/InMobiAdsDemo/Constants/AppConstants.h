//
//  AppConstants.h
//  Ads Demo
//
//  Copyright (c) 2015 Inmobi. All rights reserved.
//

#ifndef Ads_Demo_AppConstants_h
#define Ads_Demo_AppConstants_h

#import "IMAppIds.h"

#define kScreen [[UIScreen mainScreen] bounds]
#define kScreenWidth CGRectGetWidth(kScreen)

#define kCellPadding 10.0
#define kGridAspectRatio (215.0/150.0)

#define kGridItemWidth ((kScreenWidth - (3 * kCellPadding)) / 2)
#define kGridItemHeight kGridItemWidth * kGridAspectRatio

#define kGridCellSize CGSizeMake (kGridItemWidth, kGridItemHeight)

#define PREROLL_URL @"https://i.l.inmobicdn.net/ifctpads/IFC/CCN/assets/KygoStoleTheShowfeat1492609018onlinevideocutter1492609592.mp4"

#endif
