//
//  SignModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SignModel.h"
#import "OwnerModel.h"
#import "NSDate+TimeAgo.h"

@implementation SignModel

- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    self.signID = dataDic[@"id"];
    
    NSDictionary *owner = dataDic[@"owner"];
    if(owner != nil){
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:owner];
        self.owner = ownerModel;
    }
    
    NSNumber *timeSince = dataDic[@"created"];
    // 格式化时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeSince integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    //        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *timeString = [date timeAgoWithLimit:24*60*60 dateFormatter:dateFormatter];
    self.created = timeString;
    
    // 点赞用户
    NSArray *linked_users = dataDic[@"linked_users"];
    NSMutableArray *owners = @[].mutableCopy;
    [linked_users enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:obj];
        [owners addObject:ownerModel];
    }];
    self.linked_users = owners;
    
}

@end
