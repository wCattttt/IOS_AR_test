//
//  CommentModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommentModel.h"
#import "OwnerModel.h"
#import "NSDate+TimeAgo.h"

@implementation CommentModel
- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    NSDictionary *formOwnerDic = dataDic[@"from_user"];
    if(formOwnerDic != nil){
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:formOwnerDic];
        self.from_ownerModel = ownerModel;
    }
    
    NSDictionary *toOwnerDic = dataDic[@"to_user"];
    if(toOwnerDic != nil){
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:toOwnerDic];
        self.to_ownerModel = ownerModel;
    }
    
    // 格式化时间
    NSNumber *timeSince = dataDic[@"create_time"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeSince integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    //        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *timeString = [date timeAgoWithLimit:24*60*60 dateFormatter:dateFormatter];
    self.create_time = timeString;
    
}

@end
