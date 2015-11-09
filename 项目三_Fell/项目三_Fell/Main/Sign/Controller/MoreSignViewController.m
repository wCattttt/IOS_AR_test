//
//  MoreSignViewController.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MoreSignViewController.h"
#import "MoreSignTableView.h"
#import "AFNetworking.h"
#import "MoreSignModel.h"
#import "CreateViewController.h"

@interface MoreSignViewController ()
{
    MoreSignTableView *_signTableView;
    NSMutableArray *_data;
}
@end

@implementation MoreSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _reloadData];
    
    [self _createView];
}

- (void)_reloadData{
    _data = @[].mutableCopy;
    NSString *urlString = @"http://x.feelapp.cc/api/v3/goals/recommend?page=1&page_size=10";
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    [sessionManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *datas = responseObject[@"data"];
        [datas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            MoreSignModel *moreSignModel = [[MoreSignModel alloc] initWithDataDic:obj];
            [_data addObject:moreSignModel];
        }];
        _signTableView.data = _data;
        [_signTableView reloadData];
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求错误 %@", error);
    }];
}

- (void)_createView{
    self.title = @"更多打卡";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStyleDone target:self action:@selector(createAction)];
    
    _signTableView = [[MoreSignTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_signTableView];
}

- (void)createAction{
    CreateViewController *createViewController = [[CreateViewController alloc] init];
    
    [self.navigationController pushViewController:createViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
