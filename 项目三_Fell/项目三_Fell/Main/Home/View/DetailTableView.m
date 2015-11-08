//
//  DetailTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailTableView.h"
#import "AttentionModel.h"
#import "DetailCell.h"
#import "CardModel.h"
#import "OwnerModel.h"
#import "DetailHeaderView.h"
#import "CommentModel.h"
#import "DetailCommentModel.h"
#import "DetailHeaderView.h"
#import "CommentViewController.h"

@implementation DetailTableView

{
    NSString *_identifier;
//    NSMutableArray *_commentDatas;
//    NSMutableArray *_replyDatas;
//    NSMutableDictionary *_comment;  // 每条评论对应的回复 key:评论ID，value:评论对应的回复
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
//        [self _initData];
        [self _createView];
    }
    return self;
}

- (void)_createView{
    self.backgroundColor = [UIColor whiteColor];
    self.dataSource = self;
    self.delegate = self;
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _identifier = @"detailCell";
    [self registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:_identifier];
    
}

- (void)setData:(NSArray *)data{
    _data = data;
//    [self reloadData];
}

#pragma mark UITableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    cell.clipsToBounds = YES;
    cell.detailCommentModel = _data[indexPath.row];

//    [self reloadData];

     return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DetailHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"DetailHeaderView" owner:self options:nil] lastObject];
    headerView.attentionModel = _attentionModel;
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 66;    // 头像视图+底部间隔高度
    DetailCommentModel *detailModel = _data[indexPath.row];
    
    // 计算评论视图
    NSInteger count = [detailModel.subCommentCount integerValue];
    NSLog(@"%ld", count);
    if(count > 0 && count <= 3){
        height = height + 24*(count +1);
    }else if(count > 3){
        height = height + 24*4;
    }
    
    // 计算文本内容高度
    // 拿到回复的内容
    NSString *content = detailModel.content;
    CGSize fontsize = CGSizeMake(220, 1000);
    UIFont *font = [UIFont systemFontOfSize:17];
    content = [content stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    CGRect frame = [content boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    height = height + frame.size.height;
//    NSLog(@"高度：%f", height);
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    // 根据文本内容和图片计算高度
    CGFloat height = 80;    //
    // 计算文本内容高度
    NSString *contentText = _attentionModel.cardModel.desc;
    CGSize fontsize = CGSizeMake(250, 1000);
    UIFont *font = [UIFont systemFontOfSize:17];
//    contentText = [contentText stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    CGRect frame = [contentText boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    height = height + frame.size.height + 8;
    
    // 计算图片高度
    height = height + (375 + 8) * _attentionModel.cardModel.pics.count;
    
    // 计算点赞视图高度
    if(_attentionModel.cardModel.likeOwners.count > 0){
        height = height + 38;
    }
    
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailCommentModel *detailModel = _data[indexPath.row];
    
    CommentViewController *commentVC = [[CommentViewController alloc] init];
    commentVC.detailCommentModel = detailModel;
    [[self viewController].navigationController pushViewController:commentVC animated:YES];
}

- (UIViewController *)viewController{
    UIResponder *next = self.nextResponder;
    do {
        if([next isKindOfClass:[UIViewController class]]){
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    return nil;
}

/*
- (void)_initData{
    _commentDatas = [NSMutableArray array];
    _replyDatas = [NSMutableArray array];
    _comment = @{}.mutableCopy;
    NSArray *comments = _attentionModel.cardModel.comments;
    // 遍历回复数组，将评论和回复CommentModel分开
    [comments enumerateObjectsUsingBlock:^(CommentModel *commentModel, NSUInteger idx, BOOL *stop) {
        if([commentModel.to_user_id stringValue].length == 0){
            [_commentDatas addObject:commentModel];
        }else{
            [_replyDatas addObject:commentModel];
        }
    }];
    
    // 根据评论中的commentID 查询出这个ID对应的所有回复replyModel, 再加到comment字典中
    [_commentDatas enumerateObjectsUsingBlock:^(CommentModel *commentModel, NSUInteger idx, BOOL *stop) {
        NSString *commentID = [commentModel.comment_id stringValue];
        //        NSLog(@"==========COmmentID : %@", commentID);
        NSMutableArray *replys = @[].mutableCopy;
        [_replyDatas enumerateObjectsUsingBlock:^(CommentModel *replyCommentModel, NSUInteger idx, BOOL *stop) {
            //            NSLog(@"--------------%@", [replyCommentModel.original_comment_id stringValue]);
            if([[replyCommentModel.original_comment_id stringValue] isEqualToString:commentID]){
                [replys addObject:replyCommentModel];
            }
        }];
        if(replys.count > 0){
            [_comment setObject:replys forKey:commentID];
        }
    }];
}
 */

@end
