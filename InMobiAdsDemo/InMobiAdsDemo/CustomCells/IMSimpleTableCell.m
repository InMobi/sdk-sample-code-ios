//
//  IMSimpleTableCell.m
//  Ads Demo
//
//  Copyright © 2016 Inmobi. All rights reserved.
//

#import "IMSimpleTableCell.h"

@implementation SampleData

@end
@implementation IMSimpleTableCell
@synthesize Title = _Title;
@synthesize SubTitle = _SubTitle;
@synthesize Time_tt = _Time_tt;
@synthesize Description_dd = _Description_dd;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize BigImageView = _BigImageView;
@synthesize Description_heading = _Description_heading;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (NSString *) reuseIdentifier {
    return @"IMSimpleTableCell";
}
@end
