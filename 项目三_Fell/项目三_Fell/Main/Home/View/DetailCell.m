//
//  DetailCell.m
//  项目三_Fell
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailCell.h"
#import "AttentionModel.h"
#import "OwnerModel.h"
#import "CardModel.h"
#import "UIView+FDCollapsibleConstraints.h"
#import "UIImageView+WebCache.h"
#import "CommentModel.h"
#import "DetailCommentModel.h"

#define cellWidth self.contentView.bounds.size.width
#define cellHeight self.contentView.bounds.size.height

@implementation DetailCell
{
//    NSMutableArray *_commentDatas;
//    NSMutableArray *_replyDatas;
//    NSMutableDictionary *_comment;  // 每条评论对应的回复 key:评论ID，value:评论对应的回复
}

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
//        [self _createView];
    }
    return self;
}
- (void)_createView{
}

- (void)setDetailCommentModel:(DetailCommentModel *)detailCommentModel{
    _detailCommentModel = detailCommentModel;

    // 头像
    UIImageView *ownerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 40, 40)];
    [ownerImageView setImageWithURL:[NSURL URLWithString:_detailCommentModel.from_ownerModel.avatar]];
    ownerImageView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:ownerImageView];
    
    // 名字
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ownerImageView.right + 8, 8 , 100, 24)];
    nameLabel.text = _detailCommentModel.from_ownerModel.nick;
    [self.contentView addSubview:nameLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabel.left, ownerImageView.bottom - 20, 60, 20)];
    timeLabel.text = _detailCommentModel.create_time;
    timeLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:timeLabel];
    
    // 回复数
    UILabel *replyLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellWidth - 60, 8, 60, 21)];
    replyLabel.text = [NSString stringWithFormat:@"回复(%ld)", [_detailCommentModel.subCommentCount integerValue]];
    replyLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:replyLabel];
    
    // 回复
    UIImageView *replyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(cellWidth - replyLabel.width - 20, 8, 20, 20)];
    replyImageView.image = [UIImage imageNamed:@"icon_comments36C.png"];
    [self.contentView addSubview:replyImageView];
    
    // 内容
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabel.left, timeLabel.bottom + 8, cellWidth - nameLabel.left - 8, [self calculateText:_detailCommentModel.content fontSize:14])];
    NSLog(@"%@++++++++++++%f", _detailCommentModel.content,[self calculateText:_detailCommentModel.content fontSize:14]);
    contentLabel.numberOfLines = 0;
    contentLabel.text = _detailCommentModel.content;
    [self.contentView addSubview:contentLabel];
    
    // 回复视图
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(contentLabel.left, contentLabel.bottom + 8, cellWidth - contentLabel.left - 8, 40)];
    bgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:bgView];
    
    
}

- (CGFloat)calculateText:(NSString *)text fontSize:(NSInteger)size{
    CGSize fontsize = CGSizeMake(250, 1000);
    UIFont *font = [UIFont systemFontOfSize:size];
    CGRect frame = [text boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return frame.size.height;
}

@end
