//
//  CommentHeaderView.m
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommentHeaderView.h"
#import "UIImageView+WebCache.h"
#import "DetailCommentModel.h"
#import "OwnerModel.h"

@implementation CommentHeaderView

- (void)setDetailCommentModel:(DetailCommentModel *)detailCommentModel{
    _detailCommentModel = detailCommentModel;
    
    _ownerImageView.layer.masksToBounds = YES;
    _ownerImageView.layer.cornerRadius = 20;
    
    // 填充数据
    [_ownerImageView setImageWithURL:[NSURL URLWithString:_detailCommentModel.from_ownerModel.avatar] placeholderImage:[UIImage imageNamed:@"tint_CCC"]];
    
    _nameLabel.text = _detailCommentModel.from_ownerModel.nick;
    _timeLabel.text = _detailCommentModel.create_time;
    _contentLabel.text = _detailCommentModel.content;
    
}

@end
