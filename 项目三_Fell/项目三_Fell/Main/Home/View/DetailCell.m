//
//  DetailCell.m
//  项目三_Fell
//
//  Created by imac on 15/11/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailCell.h"
#import "DetailCommentModel.h"
#import "OwnerModel.h"
#import "CardModel.h"
#import "UIImageView+WebCache.h"
#import "CommentModel.h"
#import "UIView+FDCollapsibleConstraints.h"

#define cellWidth self.bounds.size.width

@implementation DetailCell
{
    UIImageView *ownerImageView;
    UILabel *nameLabel;
    UILabel *timeLabel;
    UILabel *replyLabel;
    UIImageView *replyImageView;
    UILabel *contentLabel;
    UIView *bgView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){

    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}

- (void)awakeFromNib {
    _ownerImageVIew.layer.masksToBounds = YES;
    _ownerImageVIew.layer.cornerRadius = 20;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews{
    
}

- (void)setDetailCommentModel:(DetailCommentModel *)detailCommentModel{
    _detailCommentModel = detailCommentModel;
    
    // 头像
    [_ownerImageVIew setImageWithURL:[NSURL URLWithString:_detailCommentModel.from_ownerModel.avatar] placeholderImage:[UIImage imageNamed:@"cbutton_float64@2x"]];
    
    // 名字
    _nameLabel.text = _detailCommentModel.from_ownerModel.nick;
    
    // 时间
    _timeLabel.text = _detailCommentModel.create_time;
    
    // 回复数
    if(_detailCommentModel.subCommentCount > 0){
        _replyLabel.text = [NSString stringWithFormat:@"回复(%@)", [_detailCommentModel.subCommentCount stringValue]];
    }else{
        _replyLabel.text = @"回复";
    }
    
    // 内容
    _contextLabel.text = _detailCommentModel.content;
    
    // 回复的背景
    
    if([_detailCommentModel.subCommentCount integerValue] > 0){
        switch ([_detailCommentModel.subCommentCount integerValue]) {
            case 1:
                [self replyOne];
                break;
                
            case 2:
                [self replyOne];
                [self replyTwo];
                break;
                
            default:
                [self replyOne];
                [self replyTwo];
                [self replyThree];
                // 所有回复
                _allreplyLabel.text = [NSString stringWithFormat:@"查看 %ld 条回复", [_detailCommentModel.subCommentCount integerValue]];
                break;
        }
    }else{
        _bgView.hidden = YES;
        _replyOneView.hidden = YES;
        _replyTwoView.hidden = YES;
        _replyThreeView.hidden = YES;

        _bgView.fd_collapsed = YES;
        _replyOneView.fd_collapsed = YES;
        _replyTwoView.fd_collapsed = YES;
        _replyThreeView.fd_collapsed = YES;
    }
    
    
}


- (void)replyOne{
    // 回复一
    _bgView.hidden = NO;
    _bgView.fd_collapsed = NO;
    _replyOneView.hidden = NO;
    _replyOneView.fd_collapsed = NO;
    _replyTwoView.hidden = YES;
    _replyTwoView.fd_collapsed = YES;
    _replyThreeView.hidden = YES;
    _replyThreeView.fd_collapsed = YES;
    _allreplyView.hidden = YES;
    _allreplyView.fd_autoCollapse = YES;
    CommentModel *oneModel = _detailCommentModel.subCommentModels[0];
    _userOneLabel.text = [NSString stringWithFormat:@"%@:", oneModel.from_ownerModel.nick];
    _commentOneLabel.text = oneModel.content;
}

- (void)replyTwo{
    // 回复二
    _bgView.hidden = NO;
    _bgView.fd_collapsed = NO;
//    _bgView.transform = CGAffineTransformMakeScale(1, 1);
    
//    _replyOneView.hidden = NO;
    _replyTwoView.hidden = NO;
//    _replyOneView.fd_collapsed = NO;
    _replyTwoView.fd_collapsed = NO;
    _replyThreeView.hidden = YES;
    _replyThreeView.fd_collapsed = YES;
    _allreplyView.hidden = YES;
    _allreplyView.fd_autoCollapse = YES;
    CommentModel *twoModel = _detailCommentModel.subCommentModels[1];
    _userTwoLabel.text = [NSString stringWithFormat:@"%@:", twoModel.from_ownerModel.nick];
    _commentTwoLabel.text = twoModel.content;
}

- (void)replyThree{
    // 回复三
    _bgView.hidden = NO;
    _bgView.fd_collapsed = NO;
//    _replyOneView.hidden = NO;
//    _replyTwoView.hidden = NO;
    _replyThreeView.hidden = NO;
//    _replyOneView.fd_collapsed = NO;
//    _replyTwoView.fd_collapsed = NO;
    _replyThreeView.fd_collapsed = NO;
    CommentModel *threeModel = _detailCommentModel.subCommentModels[2];
    _userThreeLabel.text = [NSString stringWithFormat:@"%@:", threeModel.from_ownerModel.nick];
    _commentThreeLabel.text = threeModel.content;
}

- (CGFloat)calculateText:(NSString *)text fontSize:(NSInteger)size{
    CGSize fontsize = CGSizeMake(180, 1000);
    UIFont *font = [UIFont systemFontOfSize:size];
    CGRect frame = [text boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return frame.size.height;
}


@end
