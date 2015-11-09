//
//  HeaderImageModel.h
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface HeaderImageModel : BaseModel

/*
 "id": 247,
 "title": "",
 "description": "",
 "image": "ad/2015-11-7/j/jIVJNb.png",
 "target_type": "card",
 "target_id": "",
 "url": "feel://card/2906425",
 "end_time": 0,
 "sort_order": 0,
 "created": 1446890935,
 "is_del": 0
 */

@property (nonatomic, copy) NSString *imageID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgDescription;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *target_type;
@property (nonatomic, copy) NSString *target_id;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, strong) NSNumber *sort_order;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, strong) NSNumber *is_del;


@end
