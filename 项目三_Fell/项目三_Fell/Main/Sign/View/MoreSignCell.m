//
//  MoreSignCell.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MoreSignCell.h"
#import "UIImageView+WebCache.h"
#import "MoreSignModel.h"

@implementation MoreSignCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setMoreSignModel:(MoreSignModel *)moreSignModel{
    _moreSignModel = moreSignModel;
    [_imageView setImageWithURL:[NSURL URLWithString:_moreSignModel.icon]];
    _titleLabel.text = _moreSignModel.intro;
    _personNumLabel.text = [NSString stringWithFormat:@"%@人参与", _moreSignModel.members];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
