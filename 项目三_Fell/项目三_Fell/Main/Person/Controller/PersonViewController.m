//
//  PersonViewController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PersonViewController.h"
#import "AFNetworking.h"
#import "OwnerModel.h"

@interface PersonViewController ()
{
    OwnerModel *_ownerModel;
}
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createView];
    
    [self _reloadData];
}

- (void)_createView{
    
}

- (void)_reloadData{
    NSString *urlString = @"http://54.223.145.126/api/p3/user/profile/2297475?card_num=4";
    AFHTTPSessionManager *sessionManger = [AFHTTPSessionManager manager];
    [sessionManger.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    [sessionManger GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        OwnerModel *owner = [[OwnerModel alloc] initWithDataDic:responseObject[@"data"][@"user"]];
        _ownerModel = owner;
        _personTableView.ownerModel = _ownerModel;
        [_personTableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
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
