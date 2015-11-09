//
//  AttentionTableView.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotHeaderModel;
@interface AttentionTableView : UITableView<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, retain) NSArray *data;
@property (nonatomic, assign) BOOL isHotVC;
@property (nonatomic, retain) HotHeaderModel *hotHeaderModel;

@end
