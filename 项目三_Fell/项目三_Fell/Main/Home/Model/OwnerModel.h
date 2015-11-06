//
//  OwnerModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel
/*
"owner": {             // 楼主信息
    "id": 2297475,
    "nick": "瞅啥瞅_",
    "avatar": "http://img01.feelapp.cc/avatar/caeef43d563c79c9698d1ee4219db63d/f/fc7ec3fabc17a0fbb31517ad409f2dc8.jpg",            // 头像
    "sex": "m",     // m男 f女 x不确定
    "reg_time": 1446251141,         // 注册时间
    "birthday": "1995-09-08",
    "data_from": "zy_app_ios",      // 客户端
    "follow": 1,
    "is_leader": 1,
    "intro": "简介"          // 简介
    "is_enable": 1,
    "reg_fresh": 0,
    "location": "",            // 地址
    "often_location": "新疆，天津，北京",         // 常住地
    "constellation": "处女座"
},
*/

@property (nonatomic, strong) NSNumber*ownerID;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, strong) NSNumber *reg_time;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *data_from;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *often_location;
@property (nonatomic, copy) NSString *constellation;

@end
