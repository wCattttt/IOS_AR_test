//
//  OwnerModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "OwnerModel.h"



@implementation OwnerModel
- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    self.ownerID = dataDic[@"id"];
    
    
}
@end
