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
#import "MJRefresh.h"

@interface AttentionViewController ()
{
    NSMutableArray *_data;
    AttentionTableView *_attentionTableView;
    NSInteger _page;
    NSInteger page_size;
    NSInteger _tag;
}
@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _page = 1;
    page_size = 10;
    _tag = 1;
    
    _attentionTableView.hidden = YES;
    [self _reloadData];

    [self _createView];
    
    [self addMJRefresh];
}


- (void)_reloadData{
    /*
     URL: http:x.feelapp.cc/api/v1/users/2297475/follow/dynamic?comment=1&page=1&page_size=10
     GET
     feeltoken : 1ddc65e0ef1fde43ffac65acc5cfb3e0
     */

    if(_tag == 100){
        _page = 1;
        page_size = 10;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"http://x.feelapp.cc/api/v1/users/2297475/follow/dynamic?comment=1&page=%ld&page_size=10", _page];
    
//    NSDictionary *parameter = @{@"feeltoken":@"1ddc65e0ef1fde43ffac65acc5cfb3e0"};
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    
    [sessionManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@", responseObject);
//        [self showSuccess:@"加载成功"];
//        [self showHint:@"加载成功"];
        
        // 判断是下拉刷新、下拉加载更多数据
        if(_tag == 200){    // 上拉加载更多数据
//            _data = [NSMutableArray array];
            NSMutableArray *newData = @[].mutableCopy;
            NSArray *datas = responseObject[@"data"];
            [datas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                AttentionModel *attentionModel = [[AttentionModel alloc] initWithDataDic:obj];
                [newData addObject:attentionModel];
            }];
            if (newData.count > 0) {
                //删除第一条重复的微博
                [newData removeObjectAtIndex:0];
                
                [_data addObjectsFromArray:newData];
            }
            _attentionTableView.data = _data;
            [_attentionTableView reloadData];
            // 结束下拉刷新
//            [_attentionTableView.gifHeader endRefreshing];
            // 结束上拉加载更多数据
            [_attentionTableView.legendFooter endRefreshing];
        }else { // 下拉或者第一次进入首页
            _data = [NSMutableArray array];
            NSArray *datas = responseObject[@"data"];
            [datas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                AttentionModel *attentionModel = [[AttentionModel alloc] initWithDataDic:obj];
                [_data addObject:attentionModel];
            }];
            _attentionTableView.data = _data;
            [_attentionTableView reloadData];
            _attentionTableView.hidden = NO;
            // 结束下拉刷新
            [_attentionTableView.gifHeader endRefreshing];
            // 结束上拉加载更多数据
//            [_attentionTableView.legendHeader endRefreshing];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
   
}

#pragma mark  添加MJ类库的刷新方法
- (void)addMJRefresh{
    //2.添加上拉刷新控件
    
    __weak AttentionViewController *weakSelf = self;
    [_attentionTableView addLegendFooterWithRefreshingBlock:^{
        
        [weakSelf _loadNextWeibo];
        
    }];
    
    
    //3.下拉刷新，播放gif图片动画
    [_attentionTableView addGifHeaderWithRefreshingBlock:^{
        
        [weakSelf _loadNewWeibo];
        
    }];
    
    NSMutableArray *imgs = @[].mutableCopy;
    for (int i=0; i<3; i++) {
        NSString *imgName = [NSString stringWithFormat:@"load2_%d",i];
        UIImage *img = [UIImage imageNamed:imgName];
        [imgs addObject:img];
    }
    //设置GIF图片
    [_attentionTableView.gifHeader setImages:imgs
                           forState:MJRefreshHeaderStateRefreshing];
    [_attentionTableView.gifHeader setImages:imgs forState:MJRefreshHeaderStateIdle];
    
    //4.上拉播放Gif
    //    self.tableView.gifFooter
    
    
    
    //修改标题
    [_attentionTableView.gifHeader setTitle:@"下拉刷新" forState:MJRefreshHeaderStateIdle];
    [_attentionTableView.gifHeader setTitle:@"松开刷新" forState:MJRefreshHeaderStatePulling];
    [_attentionTableView.gifHeader setTitle:@"拼命加载中..." forState:MJRefreshHeaderStateRefreshing];
}


#pragma mark 加载新消息(未读)的数据 下拉
- (void)_loadNewWeibo {
    
    _tag = 100;
    [self _reloadData];
    
}

#pragma mark 加载下一页消息的数据
- (void)_loadNextWeibo {
    
    _page ++;
    _tag = 200;
    [self _reloadData];
}

#pragma mark 创建表视图
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
