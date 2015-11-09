//
//  SignModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@class OwnerModel;

@interface SignModel : BaseModel
/*
"id": 2893467,
"uid": 2263581,
"lng": 114.12842123171832,
"lat": 22.713513923733494,
"created": 1446768758,
"is_del": 0,
"status": 2,
"goal_id": 9497,
"type": "goal_post",
"expires": 0,
"anonymous": 0,
"tags": [
         {
             "cid": 2,
             "bname": "步出健康",
             "bid": 78118
         }
         ],
"pics": [
         {
             "uri": "http://img01.feelapp.cc/cards/cc993f216a36a087ebd0c2d735dba160/0/05ab070acbab9e2adc1aabf5b6ea63e2.jpg",
             "width": 540,
             "height": 960
         },
         {
             "uri": "http://img01.feelapp.cc/cards/cc993f216a36a087ebd0c2d735dba160/3/366b913709cbcb09bd5ba30b24353f6f.png",
             "width": 1080,
             "height": 1080
         }
         ],
"owner": {
    "id": 2263581,
    "nick": "恋夕夏",
    "avatar": "http://img01.feelapp.cc/avatar/ef15b5c27bb7b7db5585faf4a23e7c05/d/df12edb248c480a57d6bd07f03b7cfdd.jpg",
    "sex": "f",
    "reg_time": 1444626232,
    "data_from": "weibo_android_yyb",
    "follow": 0,
    "is_leader": 0,
    "intro": "",
    "is_enable": 1,
    "reg_fresh": 0,
    "location": "",
    "often_location": ""
},
"comment_count": 0,
"very_count": 3,
"dislike_count": 0,
"view_count": 0,
"linked_users": [
                 {
                     "id": 2075380,
                     "nick": "晓晓宇宙",
                     "avatar": "http://img01.feelapp.cc/avatar/7d5cf87e678746f5dc8b782322d91a06/8/899f7b98afdaac28feb9b7e36175821c.jpg",
                     "sex": "m",
                     "reg_time": 1441545119,
                     "birthday": "1988-09-09",
                     "data_from": "zy_app_ios",
                     "follow": 0,
                     "is_leader": 0,
                     "intro": "点滴累积，贵在坚持",
                     "is_enable": 1,
                     "reg_fresh": 0,
                     "often_location": "梅州 深圳",
                     "constellation": "处女座"
                 },
                 {
                     "id": 1964986,
                     "nick": "Qincan",
                     "avatar": "feel-avatar/2015-8-26/b/bueYJ3.jpg",
                     "sex": "m",
                     "reg_time": 1440582326,
                     "birthday": "1979-01-24",
                     "data_from": "zy_app_ios",
                     "follow": 0,
                     "is_leader": 0,
                     "intro": "坚持到底",
                     "is_enable": 1,
                     "reg_fresh": 0,
                     "often_location": "",
                     "constellation": "水瓶座"
                 },
                 {
                     "id": 2261743,
                     "nick": "陈5723",
                     "avatar": "http://wx.qlogo.cn/mmopen/iaRlzG8zy7BvC4Zn8gYP99zLzBlHURX4dXV1gbtZmdouvXKvadibI1MTaKOGNDcDXPsejIdBiaehVRjpgiaSicv98CPnRZJgaaibN3/0",
                     "sex": "m",
                     "reg_time": 1444559422,
                     "birthday": "1982-12-29",
                     "data_from": "wechat_ios",
                     "follow": 0,
                     "is_leader": 0,
                     "intro": "减肥哦
                     ",
                     "is_enable": 1,
                     "reg_fresh": 0,
                     "often_location": "深圳坪山",
                     "constellation": "摩羯座",
                     "device_type": 0
                 }
                 ],
"ever_very": 0,
"ever_want": 0,
"ever_dislike": 0,
"comments": [ ],
"share_to_weibo": 0,
"checkin_created": 1446768758,
"comment": "",
"total": 11,
"combo": 4,
"goal": {
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
    "config_set": {
        "distance": 1000
    },
    "total_checkin_count": 0,
    "today_checkin_count": 0,
    "restricted": 0,
    "topic": "",
    "topic_count": 0,
    "today_topic_count": 0,
    "tags": [ ]
},
"record": {
    "device": "run_tracker",
    "info": {
        "points":  [],
                        [],
                        []......  // 运动轨迹 ： 在地图上的坐标(保存了定位刷新的所有经纬度)
        
        "platform": "android",
        "max_speed": 23.64427947998047,
        "end_time": 1446768753,
        "min_speed": 0.02408899925649166,
        "duration": 2622,
        "distance": 8728.461791038513,
        "calorie": 467.76372849152676,
        "avg_speed": 12.202898037956757
    },
    "created": 0,
    "record_time": 1446768757262,
    "goal_type": 6,
    "platform": "android",
    "uid": "2263581"
},
"checkinWithCard": false,
"highlight": false,
"is_top": false
},
 */

@property (nonatomic, copy) NSString *signID;
@property (nonatomic, copy) NSString *desc; // 内容
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, retain) NSArray *pics;
@property (nonatomic, strong) OwnerModel *owner;    // 发布者
@property (nonatomic, strong) NSNumber *very_count; // 点赞数
@property (nonatomic, retain) NSArray *linked_users;    // 点赞用户
 
@end
