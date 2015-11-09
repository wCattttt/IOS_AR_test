//
//  PersonTableView.h
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OwnerModel;
@interface PersonTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) OwnerModel *ownerModel;

@end
