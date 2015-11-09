//
//  HotHeaderModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
// 热门消息的头视图 图片模型
@interface HotHeaderModel : BaseModel

/*
 "group_id": 16,
 "height": 244,
 "width": 640,
 "group_name": "热门",
 "position": 0,
 "items": [],
 "created": 1425042249,
 "is_del": 0
 */

@property (nonatomic, copy) NSString *group_id;
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, copy) NSString *group_name;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *is_del;

@end
