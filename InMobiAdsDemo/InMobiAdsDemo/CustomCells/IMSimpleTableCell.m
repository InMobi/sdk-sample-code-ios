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
