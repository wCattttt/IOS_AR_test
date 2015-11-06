//
//  CardModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
@class OwnerModel;
@class CommentModel;

/*
"card": {
    "id": 2827536,
    "desc": "😄",      // 内容
    "uid": 2297475,    // uid
    "lng": 112.8874020915092,      // 经度
    "lat": 28.2186181336513,          // 纬度
    "loc": "湖南省岳麓区",           // 地点
    "created": 1446262456,
    "is_del": 0,
    "status": 1,
    "goal_id": 0,
    "type": "card",        // 类型
    "expires": 0,
    "anonymous": 0,
    "tags": [          // 带的标签(数组、多个)
             {
                 "cid": 2,
                 "bname": "HUF",    // 标签名
                 "bid": 810
             }
             ],
    "pics": [          // 发布的图片数据(数组)
             {
                 "uri": "http://img01.feelapp.cc/cards/caeef43d563c79c9698d1ee4219db63d/e/edf0f724009bc53332df787eb521f02b.jpg",
                 "width": 640,
                 "height": 640
             }
             ],
    
    "owner": {OwnerModel},
    "comment_count": 1,        // 评论数
    "very_count": 0,               // 赞
    "dislike_count": 0,
    "view_count": 0,
    "linked_users": [ ],   // 点赞的链接用户(一页只显示十条)
    "ever_very": 0,
    "ever_want": 0,
    "ever_dislike": 0,
    
    "comments": [CommentModel],
    
    "share_to_weibo": 0
    */

// 帖子model
@interface CardModel : BaseModel

@property (nonatomic, strong) NSNumber *cardID;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSNumber *lng;
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, copy) NSString *loc;
@property (nonatomic, strong) NSNumber *created;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, retain) NSArray *tags;
@property (nonatomic, retain) NSArray *pics;
@property (nonatomic, strong) OwnerModel *ownerModel;
@property (nonatomic, strong) NSNumber *comment_count;
@property (nonatomic, strong) NSNumber *very_count;
@property (nonatomic, retain) NSArray *comments;    // !!!遍历数组，找数据给commentModel
@property (nonatomic, retain) NSArray *likeOwners;
@property (nonatomic, strong) NSNumber *share_to_weibo;

@end
