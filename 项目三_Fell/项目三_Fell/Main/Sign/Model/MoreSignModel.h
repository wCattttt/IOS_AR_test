//
//  MoreSignModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
@class OwnerModel;

@interface MoreSignModel : BaseModel

/*
    "id": 9497,
    "creator_id": 2,
    "category_id": 8,
    "name": "坚持跑步，分享运动轨迹",
    "intro": "坚持跑步，分享运动轨迹。",
    "icon": "http://img01.feelapp.cc/goal/2015-11-4/7/73AVv2.png",
    "cover": "",
    "created": 1441711193,
    "is_recommend": true,
    "reward_small_img": "goal/2015-9-30/Q/Q3a2yq.jpg",
    "reward_big_img": "http://img01.feelapp.cc/goal/2015-10-28/f/fAFVfa.jpg",
    "reward_name": "",
    "reward_desc": "",
    "goal_type": 6,
    "creator": {
        "id": 2,
        "nick": "Feel君",
        "avatar": "feel-avatar/2014-11-11/r/reUjea.jpg",
        "sex": "m",
        "reg_time": 0,
        "birthday": "1987-11-11",
        "data_from": "zy_app",
        "intro": "官方卖萌小账号",
        "cover": "feel-cover/2015-3-14/z/zA3eeu.jpg",
        "is_enable": 1,
        "reg_fresh": 0,
        "verified_group": 2,
        "verified_logo": "verify/2014-12-17/a/a6NZbm.png",
        "verified_info": "Feel官方账号",
        "location": "",
        "often_location": "北京 东单",
        "constellation": "天蝎座",
        "device_type": 0
    },
    "category": {
        "id": 8,
        "icon": "goal/2015-10-27/7/77NBRz.png",
        "cover": "",
        "name": "跑步工具",
        "intro": "",
        "created": 1439017201,
        "sort_order": 255,
        "is_del": false,
        "tags": [
                 {
                     "bid": 78118,
                     "cid": 2,
                     "bname": "步出健康",
                     "creater": 0,
                     "created": 1439017152,
                     "is_recommend": 1,
                     "is_verified": 0,
                     "exposed": 1,
                     "is_hot": 0,
                     "bars": [ ],
                     "isTop": 0
                 }
                 ]
    },
    "progress": {
        "status": 0,
        "type": "goal",
        "expires": 0,
        "anonymous": 0,
        "share_to_weibo": 0,
        "checkin_created": 0,
        "total": 0,
        "combo": 0,
        "rank": 0,
        "checkinWithCard": false
    },
    "joined": 0,
    "members": 18547,
    "config_set": {
        "distance": 1000
    },
    "total_checkin_count": 7336,
    "today_checkin_count": 19,
    "restricted": 0,
    "topic": "",
    "topic_count": 1524,
    "today_topic_count": 19,
    "tags": [
             {
                 "bid": 78118,
                 "cid": 2,
                 "bname": "步出健康",
                 "creater": 0,
                 "created": 1439017152,
                 "is_recommend": 1,
                 "is_verified": 0,
                 "exposed": 1,
                 "is_hot": 0,
                 "bars": [ ],
                 "isTop": 0
             }
             ]
    },
 */


@property (nonatomic ,copy) NSString *signID;
@property (nonatomic ,copy) NSString *creator_id;
@property (nonatomic ,copy) NSString *category_id;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *intro;
@property (nonatomic ,copy) NSString *icon;
@property (nonatomic ,copy) NSString *created;  // 创建时间
@property (nonatomic ,strong) OwnerModel *creator;  // 创建者
@property (nonatomic ,strong) NSNumber *members;  // 加入数
@property (nonatomic ,strong) NSNumber *today_topic_count;    // 今日打卡

@end
