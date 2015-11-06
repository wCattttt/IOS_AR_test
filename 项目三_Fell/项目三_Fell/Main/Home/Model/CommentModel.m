//
//  CommentModel.m
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommentModel.h"
#import "OwnerModel.h"

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
    
}

@end
