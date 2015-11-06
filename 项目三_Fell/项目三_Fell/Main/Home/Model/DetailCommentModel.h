//
//  DetailCommentModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@class CommentModel;
@class OwnerModel;

@interface DetailCommentModel : BaseModel
@property (nonatomic, strong) NSNumber *comment_id;
@property (nonatomic, strong) NSNumber *card_id;
@property (nonatomic, strong) NSNumber *from_user_id;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, strong) OwnerModel *from_ownerModel;
@property (nonatomic, strong) NSNumber *subCommentCount;    // 回复数
@property (nonatomic, strong) NSArray *subCommentModels;
@property (nonatomic, retain) NSArray *picList;

@end
