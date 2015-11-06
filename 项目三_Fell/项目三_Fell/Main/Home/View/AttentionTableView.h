//
//  AttentionTableView.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttentionTableView : UITableView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSArray *data;

@end
