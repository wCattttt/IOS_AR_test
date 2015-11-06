//
//  DetailCommentModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailCommentModel.h"
#import "OwnerModel.h"
#import "CommentModel.h"
#import "NSDate+TimeAgo.h"

@implementation DetailCommentModel

- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    NSDictionary *formOwnerDic = dataDic[@"from_user"];
    if(formOwnerDic != nil){
        OwnerModel *ownerModel = [[OwnerModel alloc] initWithDataDic:formOwnerDic];
        self.from_ownerModel = ownerModel;
    }
    
    NSArray *comments = dataDic[@"latestSubCommentList"];
    NSMutableArray *subComments = [NSMutableArray array];
    [comments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CommentModel *commentModel = [[CommentModel alloc] initWithDataDic:obj];
        [subComments addObject:commentModel];
    }];
    self.subCommentModels = subComments;

    // 格式化时间
    NSString *timeSince = dataDic[@"create_time"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeSince integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    //        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *timeString = [date timeAgoWithLimit:24*60*60 dateFormatter:dateFormatter];
    self.create_time = timeString;
    
}

@end
