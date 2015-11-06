//
//  AttentionModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@class CardModel;
@interface AttentionModel : BaseModel
/*
{
    "data": [
             {
                 "actorId": 2297475,        // 用户id
                 "actorName": "瞅啥瞅_",   //用户名
                 "actionType": 10,      // 用户类型 ?
                 "actionTime": 1446262456,      // 发送时间
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
 
                     "owner": {             // 楼主信息
                         "id": 2297475,
                         "nick": "瞅啥瞅_",
                         "avatar": "http://img01.feelapp.cc/avatar/caeef43d563c79c9698d1ee4219db63d/f/fc7ec3fabc17a0fbb31517ad409f2dc8.jpg",            // 头像
                         "sex": "m",
                         "reg_time": 1446251141,
                         "birthday": "1995-09-08",
                         "data_from": "zy_app_ios",
                         "follow": 1,
                         "is_leader": 1,
                         "intro": "简介"          // 简介
                         "is_enable": 1,
                         "reg_fresh": 0,
                         "location": "",            // 地址
                         "often_location": "新疆，天津，北京",         // 常住地
                         "constellation": "处女座"
                     },
 
                     "comment_count": 1,        // 评论数
                     "very_count": 0,               // 赞
                     "dislike_count": 0,
                     "view_count": 0,
                     "linked_users": [ ],   // 点赞的链接用户(一页只显示十条)
                     "ever_very": 0,
                     "ever_want": 0,
                     "ever_dislike": 0, 
 
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
 
                     "share_to_weibo": 0
                 }
             },
*/

@property (nonatomic, strong) NSNumber *actorId;
@property (nonatomic, copy) NSString *actorName;
@property (nonatomic, strong) NSNumber *actionType;
@property (nonatomic, copy) NSString *actionTime;
@property (nonatomic, strong) CardModel *cardModel;


@end
