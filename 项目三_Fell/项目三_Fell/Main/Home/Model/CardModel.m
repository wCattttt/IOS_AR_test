//
//  CardModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CardModel.h"
#import "OwnerModel.h"
#import "CommentModel.h"
#define domain @"http://img01.feelapp.cc/"

@implementation CardModel

- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    NSDictionary *ownerDic = dataDic[@"owner"];
    if(ownerDic != nil){
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:ownerDic];
        self.ownerModel = ownerModel;
    }
    
    self.cardID = dataDic[@"id"];
    
    // 遍历comments数组, 将数组中的数据拿出来传给CommentModel 再存入数组
    NSArray *comments = dataDic[@"comments"];
    NSMutableArray *comModels = [NSMutableArray array];
    [comments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CommentModel *commentModel = [[CommentModel alloc] initWithDataDic:obj];
        [comModels addObject:commentModel];
    }];
    self.comments = comModels;
    
    NSArray *likeUsers = dataDic[@"linked_users"];
    NSMutableArray *ownerModels = [NSMutableArray array];
    [likeUsers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:obj];
        [ownerModels addObject:ownerModel];
    }];
    self.likeOwners = ownerModels;
    
    
}


@end
