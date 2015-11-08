//
//  CommentTableView.h
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailCommentModel;
@interface CommentTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DetailCommentModel *detailCommentModel;

@end
