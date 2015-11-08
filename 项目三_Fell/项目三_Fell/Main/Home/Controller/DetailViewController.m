//
//  DetailViewController.m
//  项目三_Fell
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailNavigationView.h"
#import "UIImageView+WebCache.h"
#import "AttentionModel.h"
#import "CardModel.h"
#import "OwnerModel.h"
#import "DetailTableView.h"
#import "AFNetworking.h"
#import "DetailCommentModel.h"
#import <ShareSDK/ShareSDK.h>
#import "MJRefresh.h"

@interface DetailViewController ()
{
    DetailTableView *_detailTableView;
    NSInteger _page;
    NSInteger page_size;
    NSInteger _tag;
}
@end

@implementation DetailViewController

- (instancetype)init{
    self = [super init];
    if(self){
//        [self _reloadData];
    }
    return self;
}

//- (void)setAttentionModel:(AttentionModel *)attentionModel{
//    _attentionModel = attentionModel;
//
//}

- (void)_reloadData{
    if(_tag == 100){
        _page = 1;
        page_size = 10;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"http://x.feelapp.cc/api/p3/card/%@/comment?page=%ld&page_size=%ld", [_attentionModel.cardModel.cardID stringValue], _page, page_size];
//    NSLog(@"%@", [_attentionModel.cardModel.cardID stringValue]);
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    [sessionManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if(_tag == 200){
            NSArray *subComments = responseObject[@"data"];
            NSMutableArray *newData = @[].mutableCopy;
            [subComments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                DetailCommentModel *detailCM = [[DetailCommentModel alloc] initWithDataDic:obj];
                [newData addObject:detailCM];
            }];
            if(newData.count > 0){
                [_data addObjectsFromArray:newData];
            }
            // 网路请求完成后传入数据给TableView
            _detailTableView.data = _data;
            [_detailTableView reloadData];
            [_detailTableView.legendFooter endRefreshing];
        }else{
            _data = [NSMutableArray array];
            NSArray *subComments = responseObject[@"data"];
            [subComments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                DetailCommentModel *detailCM = [[DetailCommentModel alloc] initWithDataDic:obj];
                [_data addObject:detailCM];
            }];
            //        [self _createTableView];
            // 网路请求完成后传入数据给TableView
            _detailTableView.data = _data;
            [_detailTableView reloadData];
            [_detailTableView.legendHeader endRefreshing];
        }
        
        //显示tableView
        _detailTableView.hidden = NO;
        [self showSuccess:@"加载成功"];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"评论详情请求错误：%@", error);
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createRightBar];
  
    [self _createTitleView];
    
    [self _createTableView];
    
    [self _createShareView];
    
    _page = 1;
    page_size = 10;
    _tag = 1;
    
    [self _reloadData];
    
    [self addRefresh];
    //隐藏tableView 显示加载提示
    _detailTableView.hidden = YES;
    [self showHudInView:self.view hint:@"正在加载..."];
    
}

- (void)addRefresh{
    __weak typeof(self) weakSelf = self;
    [_detailTableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf _loadNewComment];
        
    }];
    
    //2.添加上拉刷新
    [_detailTableView addLegendFooterWithRefreshingBlock:^{
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


- (void)_createRightBar{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.layer.masksToBounds = YES;
    rightButton.layer.cornerRadius = 10;
    rightButton.frame = CGRectMake(0, 0, 50, 20);
    [rightButton setTitle:@"+关注" forState:UIControlStateNormal];
    rightButton.font = [UIFont systemFontOfSize:15];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.backgroundColor = [UIColor colorWithRed:0 green:191/255 blue:255/255 alpha:1];
    [rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)_createTitleView {
    DetailNavigationView *naView = [[[NSBundle mainBundle] loadNibNamed:@"DetailNavigationView" owner:self options:nil] lastObject];
    naView.frame = CGRectMake(0, 0, self.view.bounds.size.width - 100, 44);
    naView.backgroundColor = [UIColor clearColor];
    [naView.ownerImageView setImageWithURL:[NSURL URLWithString:_attentionModel.cardModel.ownerModel.avatar]];
    naView.ownerImageView.layer.masksToBounds = YES;
    naView.ownerImageView.layer.cornerRadius = 20;
    naView.nameLabel.text = _attentionModel.cardModel.ownerModel.nick;
    if(_attentionModel.actionTime.length == 0){
        naView.timeImageView.hidden = YES;
        naView.timeLabel.hidden = YES;
    }else{
        naView.timeLabel.text = _attentionModel.actionTime;
    }
    if(_attentionModel.cardModel.loc.length == 0){
        naView.locationImageView.hidden = YES;
        naView.locationLabel.hidden = YES;
    }else{
        naView.locationLabel.text = _attentionModel.cardModel.loc;
    }
    self.navigationItem.titleView = naView;
}

- (void)_createTableView{
    _detailTableView = [[DetailTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _detailTableView.contentInset = UIEdgeInsetsMake(0, 0, 40, 0);
    _detailTableView.attentionModel = _attentionModel;
//    detailTableView.data = _data;
    [self.view addSubview:_detailTableView];
    
}

- (void)_createShareView{
    UIView *shareView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40)];
    shareView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tint_CCC"]];
    [self.view addSubview:shareView];
    
    // 分享按钮
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(8, 0, 80, 40);
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    shareButton.font = [UIFont systemFontOfSize:14];
    [shareButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageNamed:@"icon_share36C"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:shareButton];
    
    // 评论按钮
    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commentButton.frame = CGRectMake(shareView.width - 100, 0, 60, 40);
    [commentButton setTitle:@"评论" forState:UIControlStateNormal];
    commentButton.font = [UIFont systemFontOfSize:14];
    [commentButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [commentButton setImage:[UIImage imageNamed:@"icon_comments36G"] forState:UIControlStateNormal];
    [commentButton addTarget:self action:@selector(commentAction:) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:commentButton];
    
    // 点赞按钮
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    likeButton.frame = CGRectMake(commentButton.left - 68 , 0, 60, 40);
    [likeButton setTitle:@"赞" forState:UIControlStateNormal];
    likeButton.font = [UIFont systemFontOfSize:14];
    [likeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [likeButton setImage:[UIImage imageNamed:@"icon_like36G"] forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(likeAction:) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:likeButton];
    
}

// 分享按钮
- (IBAction)shareAction:(id)sender {
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"2012100413195471481.jpg" ofType:nil];
    
    //1.构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"今天学习ShareSdk的使用"
                                       defaultContent:@"测试一下"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"无限互联"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //2.创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //3.弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
    
    
}

#pragma mark 点赞按钮
- (void)likeAction:(id)sender {
    
}

#pragma mark 评论按钮
- (void)commentAction:(id)sender {
    
}

#pragma mark 点击右边关注按钮
- (void)rightAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
