//
//  HeaderImageModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "HeaderImageModel.h"
#import "NSDate+TimeAgo.h"

@implementation HeaderImageModel
- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    self.imageID = dataDic[@"id"];
    self.imgDescription = dataDic[@"imgDescription"];
    
    // 处理时间
    NSNumber *timeSince = dataDic[@"created"];
    // 格式化时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeSince integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    //        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *timeString = [date timeAgoWithLimit:24*60*60 dateFormatter:dateFormatter];
    self.created = timeString;
    
    NSString *imageUrl = dataDic[@"image"];
    self.image = [NSString stringWithFormat:@"http://img01.feelapp.cc/%@", imageUrl];
    
}

@end
