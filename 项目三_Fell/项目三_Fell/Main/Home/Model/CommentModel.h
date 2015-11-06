//
//  CommentModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
@class OwnerModel;
/*
"comments": [          // 评论用户(在主页只显示3条)
             {
                 "comment_id": 1351393,
                 "card_id": 2827536,
                 "from_user_id": 2297475,
                 "content": "😔😔test测试",
                 "create_time": 1446343869,
                 "is_del": 0,
                 "floor_id": 2,
                 "pic_count": 0,
                 "from_user_name": "瞅啥瞅_",
                 "card_user_id": 2297475,
                 "from_user": {}
             }
             ]
*/
@interface CommentModel : BaseModel
@property (nonatomic, strong) NSNumber *comment_id;
@property (nonatomic, strong) NSNumber *card_id;
@property (nonatomic, strong) NSNumber *from_user_id;
@property (nonatomic, strong) NSNumber *to_user_id;
@property (nonatomic, strong) NSNumber *original_comment_id;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSNumber *create_time;
@property (nonatomic, strong) OwnerModel *from_ownerModel;
@property (nonatomic, strong) OwnerModel *to_ownerModel;
@property (nonatomic, copy) NSString *card_user_id;


@end
