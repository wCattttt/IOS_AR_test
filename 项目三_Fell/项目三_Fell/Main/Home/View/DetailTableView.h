//
//  DetailTableView.h
//  项目三_Fell
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AttentionModel;
@interface DetailTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) AttentionModel *attentionModel;
@property (nonatomic, retain) NSArray *data;

@end
