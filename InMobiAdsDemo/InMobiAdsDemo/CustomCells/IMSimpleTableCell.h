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
@property NSString *descriptionText;
@property NSString *thumbImage;
@property NSString *bigImage;
@end


@interface IMSimpleTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *subTitle;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UIImageView *bigImageView;
@property (nonatomic, weak) IBOutlet UILabel *descriptionHeading;
@end
