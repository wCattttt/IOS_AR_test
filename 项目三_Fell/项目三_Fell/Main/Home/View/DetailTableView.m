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
    self.dataSource = self;
    self.delegate = self;
    
    _identifier = @"detailCell";
    [self registerClass:[DetailCell class] forCellReuseIdentifier:_identifier];
    
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
    
    
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    
    cell.detailCommentModel = _data[_data.count - 1 - indexPath.row];
    
     return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DetailHeaderView *headerView = [[DetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
    headerView.attentionModel = _attentionModel;
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
#warning 根据文本内容和图片计算高度
    return 0;
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
