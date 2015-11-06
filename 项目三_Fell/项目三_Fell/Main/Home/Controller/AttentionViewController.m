//
//  AttentionViewController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "AttentionViewController.h"
#import "AFNetworking.h"
#import "AttentionModel.h"
#import "AttentionTableView.h"
#import "CardModel.h"

@interface AttentionViewController ()
{
    NSMutableArray *_data;
    AttentionTableView *_attentionTableView;
}
@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _reloadData];
    
    [self _createView];
}


- (void)_reloadData{
    /*
     URL: http:x.feelapp.cc/api/v1/users/2297475/follow/dynamic?comment=1&page=1&page_size=10
     GET
     feeltoken : 1ddc65e0ef1fde43ffac65acc5cfb3e0
     */
    
    NSString *urlString = @"http://x.feelapp.cc/api/v1/users/2297475/follow/dynamic?comment=1&page=1&page_size=10";
    
//    NSDictionary *parameter = @{@"feeltoken":@"1ddc65e0ef1fde43ffac65acc5cfb3e0"};
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    
    [sessionManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@", responseObject);
        _data = [NSMutableArray array];
        NSArray *datas = responseObject[@"data"];
        [datas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            AttentionModel *attentionModel = [[AttentionModel alloc] initWithDataDic:obj];
            [_data addObject:attentionModel];
        }];
        _attentionTableView.data = _data;
//        [_attentionTableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    /*
    _data = [NSMutableArray array];
    NSURL *url = [NSURL URLWithString:@"http://x.feelapp.cc/api/v1/users/2297475/follow/dynamic?comment=1&page=1&page_size=10"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *datas = json[@"data"];
            [datas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                AttentionModel *attentionModel = [[AttentionModel alloc] initWithDataDic:obj];
                [_data addObject:attentionModel];
            }];
            [_attentionTableView reloadData];
        }else{
            NSLog(@"%@", error);
        }
    }];
    [task resume];
  */
}


- (void)_createView{
    _attentionTableView = [[AttentionTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // 设置tableView起点
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    _attentionTableView.data = _data;
    [self.view addSubview:_attentionTableView];
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
