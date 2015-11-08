//
//  CommentViewController.m
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentTableView.h"

@interface CommentViewController ()
{
    CommentTableView *_tableView;
}
@end

@implementation CommentViewController

- (void)viewDidLoad {
    self.title = @"回复详情";
    [super viewDidLoad];
    
    [self _createTableView];
    
    [self _createFootView];
}

- (void)_createTableView{
    _tableView = [[CommentTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 40, 0);
    _tableView.detailCommentModel = _detailCommentModel;
    [self.view addSubview:_tableView];
}

- (void)_createFootView{
    // 创建底部视图
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40)];
    footView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:footView];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(8, 5, self.view.bounds.size.width - 60, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"我也说一句";
    [footView addSubview:textField];
    
    UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    postButton.frame = CGRectMake(self.view.bounds.size.width - 68, 5, 60, 30);
    [postButton setTitle:@"发表" forState:UIControlStateNormal];
    [postButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    postButton.backgroundColor = [UIColor blueColor];
    [postButton addTarget:self action:@selector(postAction) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:postButton];

}

- (void)postAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
