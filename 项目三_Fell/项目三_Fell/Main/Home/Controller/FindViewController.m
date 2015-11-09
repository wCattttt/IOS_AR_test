//
//  FindViewController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FindViewController.h"
#import "FindCollectionView.h"
#import "AFNetworking.h"
#import "CardModel.h"
#import "MJRefresh.h"

@interface FindViewController ()
{
    FindCollectionView *_collectionView;
    NSInteger _page;
    NSInteger page_size;
    NSInteger _tag;
    NSMutableArray *_data;
}
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _page = 1;
    page_size = 10;
    _tag = 1;
    
    [self _createView];
    
    [self _reloadData];
    
    [self addRefresh];
}

- (void)_reloadData{

    if(_tag == 100){
        _page = 1;
        page_size = 10;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"http://112.126.69.135/api/p3/explore/recommend?page=%ld&page_size=%ld",  _page, page_size];
    //    NSLog(@"%@", [_attentionModel.cardModel.cardID stringValue]);
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    [sessionManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if(_tag == 200){
            NSArray *subComments = responseObject[@"data"];
            NSMutableArray *newData = @[].mutableCopy;
            [subComments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                CardModel *cardModel = [[CardModel alloc] initWithDataDic:obj[@"card"]];
                [newData addObject:cardModel];
            }];
            if(newData.count > 0){
                [_data addObjectsFromArray:newData];
            }
            // 网路请求完成后传入数据给TableView
            _collectionView.data = _data;
            [_collectionView reloadData];
            [_collectionView.legendFooter endRefreshing];
        }else{
            _data = [NSMutableArray array];
            NSArray *subComments = responseObject[@"data"];
            [subComments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                CardModel*cardModel = [[CardModel alloc] initWithDataDic:obj[@"card"]];
                [_data addObject:cardModel];
            }];
            //        [self _createTableView];
            // 网路请求完成后传入数据给TableView
            _collectionView.data = _data;
            [_collectionView reloadData];
            [_collectionView.legendHeader endRefreshing];
        }
        
        //显示tableView
        _collectionView.hidden = NO;
        [self showSuccess:@"加载成功"];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"评论详情请求错误：%@", error);
    }];
}

- (void)addRefresh{
    __weak typeof(self) weakSelf = self;
    [_collectionView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf _loadNewComment];
        
    }];
    
    //2.添加上拉刷新
    [_collectionView addLegendFooterWithRefreshingBlock:^{
        [weakSelf _loadNextComment];
        
    }];
}


//加载新评论
- (void)_loadNewComment {
    _tag = 100;
    [self _reloadData];
}

//加载下一页评论
- (void)_loadNextComment {
    _page ++;
    _tag = 200;
    [self _reloadData];
    
}

- (void)_createView{
    _collectionView = [[FindCollectionView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
