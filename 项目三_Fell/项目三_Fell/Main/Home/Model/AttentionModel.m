//
//  AttentionModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "AttentionModel.h"
#import "CardModel.h"
#import "NSDate+TimeAgo.h"
#import "OwnerModel.h"

#define domain @"http://img01.feelapp.cc/"

@implementation AttentionModel

- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    NSDictionary *card = dataDic[@"card"];
    if(card != nil){
        CardModel *cardModel = [[CardModel alloc] initWithDataDic:card];
        self.cardModel = cardModel;
    }
    
    NSNumber *timeSince = dataDic[@"actionTime"];
    // 格式化时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeSince integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    //        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *timeString = [date timeAgoWithLimit:24*60*60 dateFormatter:dateFormatter];
    self.actionTime = timeString;
    
    
    // 处理图片
    NSString *ownerImageName = [[dataDic[@"card"] objectForKey:@"owner"] objectForKey:@"avatar"];
    
    if([dataDic[@"actorId"] integerValue] == 2){
        self.cardModel.ownerModel.avatar = [NSString stringWithFormat:@"%@%@", domain , ownerImageName];
    }
    if(([dataDic[@"actorId"] integerValue] == 2 && [[dataDic[@"card"] objectForKey:@"type"] isEqualToString:@"card"]) || ([dataDic[@"actorId"] integerValue] == 2 && [[dataDic[@"card"] objectForKey:@"type"] isEqualToString:@"vote"])) {
        NSMutableArray *pics = [NSMutableArray array];
        for(int i = 0; i<self.cardModel.pics.count; i++){
            NSDictionary *picDic = [dataDic[@"card"] objectForKey:@"pics"][i];
            NSString *picName = [picDic objectForKey:@"uri"];
            NSDictionary *newDic = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@%@", domain , picName], @"uri", picDic[@"width"],@"width",  picDic[@"height"], @"height", nil];
            [pics addObject:newDic];
        }
        self.cardModel.pics = pics;
//        [self.cardModel.pics.firstObject ];
        // [NSString stringWithFormat:@"%@%@", domain , picName]
    }
    
}

@end
