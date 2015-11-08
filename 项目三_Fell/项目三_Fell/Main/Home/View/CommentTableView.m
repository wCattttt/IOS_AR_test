//
//  CommentTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommentTableView.h"
#import "DetailCommentModel.h"
#import "CommentHeaderView.h"
#import "CommentCell.h"
#import "CommentModel.h"
#import "OwnerModel.h"

@implementation CommentTableView
{
    NSString *_identifier;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor whiteColor];
    self.dataSource = self;
    self.delegate = self;
    
    _identifier = @"commentCell";
    [self registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:_identifier];
    
}

- (void)setDetailCommentModel:(DetailCommentModel *)detailCommentModel{
    _detailCommentModel = detailCommentModel;
}

#pragma mark UItableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _detailCommentModel.subCommentModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    cell.commentModel = _detailCommentModel.subCommentModels[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 33;
    
    CommentModel *commentModel = _detailCommentModel.subCommentModels[indexPath.row];
    NSString *content = [NSString stringWithFormat:@"%@:%@",commentModel.from_ownerModel.nick , commentModel.content];
    CGSize fontsize = CGSizeMake(150, 1000);
    UIFont *font = [UIFont systemFontOfSize:17];
    CGRect frame = [content boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    height = height + frame.size.height;
    return height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CommentHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CommentHeaderView" owner:self options:nil] lastObject];
    headerView.detailCommentModel = _detailCommentModel;
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height =  93;
    // 根据计算文本高度
    NSString *content = _detailCommentModel.content;
    
    UIFont *font = [UIFont systemFontOfSize:17];
    CGSize fontsize = {250, 1000};
    CGRect frame = [content boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    height = height + frame.size.height;
    return height;
}


@end
