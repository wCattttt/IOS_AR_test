//
//  InfoCell.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "InfoCell.h"
#import "UIImageView+WebCache.h"
#import "OwnerModel.h"

@implementation InfoCell

- (void)awakeFromNib {
    _personImageView.layer.masksToBounds = YES;
    _personImageView.layer.cornerRadius = 25;
}

- (void)setOwnerModel:(OwnerModel *)ownerModel{
    _ownerModel = ownerModel;
    [_personImageView setImageWithURL:[NSURL URLWithString:_ownerModel.avatar]];
    _nameLabel.text = _ownerModel.nick;
    
    NSDate *date;
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"yyyy"];
    NSString *currentDateString = [dataFormatter stringFromDate:date];
    NSString *birthday = [_ownerModel.birthday substringWithRange:NSMakeRange(0, 4)];
    NSInteger age = (NSInteger)currentDateString - (NSInteger)birthday;
    _ageLabel.text = [NSString stringWithFormat:@"%ld", age];
//    _likeLabel.text = 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
