//
//  HotHeaderModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "HotHeaderModel.h"
#import "NSDate+TimeAgo.h"
#import "HeaderImageModel.h"

@implementation HotHeaderModel

// 处理时间
- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    NSNumber *timeSince = dataDic[@"created"];
    // 格式化时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeSince integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    //        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *timeString = [date timeAgoWithLimit:24*60*60 dateFormatter:dateFormatter];
    self.created = timeString;
    
    // 遍历items数组, 将数组中的数据拿出来传给HeaderImageModel 再存入数组
    NSArray *headers = dataDic[@"items"];
    NSMutableArray *headerModels = [NSMutableArray array];
    [headers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        HeaderImageModel *headerModel = [[HeaderImageModel alloc] initWithDataDic:obj];
        [headerModels addObject:headerModel];
    }];
    self.items = headerModels;
    
}

@end
