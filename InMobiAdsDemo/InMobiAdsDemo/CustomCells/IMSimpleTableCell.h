//
//  IMSimpleTableCell.h
//  Ads Demo
//
//  Copyright © 2016 Inmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleData : NSObject
@property NSString *title;
@property NSString *subtitle;
@property NSString *time;
@property NSString *description_tt;
@property NSString *thumbimage;
@property NSString *bigimage;
@end


@interface IMSimpleTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *Title;
@property (nonatomic, weak) IBOutlet UILabel *SubTitle;
@property (nonatomic, weak) IBOutlet UILabel *Time_tt;
@property (nonatomic, weak) IBOutlet UILabel *Description_dd;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UIImageView *BigImageView;
@property (nonatomic, weak) IBOutlet UILabel *Description_heading;
@end
