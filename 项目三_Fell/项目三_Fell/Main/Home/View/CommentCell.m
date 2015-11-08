//
//  CommentCell.m
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommentCell.h"
#import "DetailCommentModel.h"
#import "OwnerModel.h"
#import "CommentModel.h"
#import "UIImageView+WebCache.h"

@implementation CommentCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCommentModel:(CommentModel *)commentModel{
    _commentModel = commentModel;
    
    [_ownerImageVIew setImageWithURL:[NSURL URLWithString:_commentModel.from_ownerModel.avatar] placeholderImage:[UIImage imageNamed:@"cbutton_float64@2x"]];
    _ownerImageVIew.layer.masksToBounds = YES;
    _ownerImageVIew.layer.cornerRadius = 20;
    _nameLabel.text = [NSString stringWithFormat:@"%@:", _commentModel.from_ownerModel.nick];
    _contentLabel.text = _commentModel.content;
    _timeLabel.text = _commentModel.create_time;
    
}

@end
