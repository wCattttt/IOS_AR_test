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

@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)init{
    self = [super init];
    if(self){
        [self _reloadData];
    }
    return self;
}

- (void)setAttentionModel:(AttentionModel *)attentionModel{
    _attentionModel = attentionModel;
    
    _data = [NSMutableArray array];
    NSString *urlString = [NSString stringWithFormat:@"http://x.feelapp.cc/api/p3/card/%@/comment?page=1&page_size=10", [_attentionModel.cardModel.cardID stringValue]];
    NSLog(@"%@", [_attentionModel.cardModel.cardID stringValue]);
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"1ddc65e0ef1fde43ffac65acc5cfb3e0" forHTTPHeaderField:@"feeltoken"];
    [sessionManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *subComments = responseObject[@"data"];
        [subComments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            DetailCommentModel *detailCM = [[DetailCommentModel alloc] initWithDataDic:obj];
            [_data addObject:detailCM];
        }];
        [self _createTableView];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"评论详情请求错误：%@", error);
    }];
    
}

- (void)_reloadData{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createRightBar];
  
    [self _createTitleView];
    
//    [self _createTableView];
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
    DetailTableView *detailTableView = [[DetailTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    detailTableView.attentionModel = _attentionModel;
    detailTableView.data = _data;
    [self.view addSubview:detailTableView];
    
}

#pragma mark 点击右边关注按钮
- (void)rightAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
