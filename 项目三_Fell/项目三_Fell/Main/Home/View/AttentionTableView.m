//
//  AttentionTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "AttentionTableView.h"
#import "AttenttionCell.h"
#import "AttentionModel.h"
#import "CardModel.h"
#import "OwnerModel.h"
#import "DetailViewController.h"
#import "AttentionViewController.h"
#import "HotHeaderModel.h"
#import "HeaderImageModel.h"
#import "UIImageView+WebCache.h"

@implementation AttentionTableView
{
    NSString *_identifier;
    UIPageControl *_pageControl;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        
        [self _createView];
        _isHotVC = NO;
    }
    return self;
}

- (void)_createView{
    self.backgroundColor = [UIColor whiteColor];
    self.dataSource = self;
    self.delegate = self;
    self.contentInset = UIEdgeInsetsMake(0, 0, 49 + 64, 0);
    
    
    _identifier = @"AttentionCell";
    [self registerClass:[AttenttionCell class] forCellReuseIdentifier:_identifier];
//    [self registerNib:[UINib nibWithNibName:@"AttenttionCell" bundle:nil] forCellReuseIdentifier:_identifier];
    
}

- (void)setData:(NSArray *)data{
    _data = data;
//    [self reloadData];
}

#pragma mark UITableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 根据数据的类型判断是否为"编辑精选", 自定义一个试图
    AttentionModel *attentionModel = _data[indexPath.row];
    if([attentionModel.actionType integerValue] == 204){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bestCell"];
        return cell;
    }
    
//    AttenttionCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    AttenttionCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AttenttionCell" owner:self options:nil] lastObject];
    cell.attentionModel = _data[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = self.bounds.size.width + 240;
    AttentionModel *attentionModel = _data[indexPath.row];
    if([attentionModel.actionType integerValue] == 204){
        return 0;
    }
    // 计算点赞视图
    NSInteger likeCount = attentionModel.cardModel.likeOwners.count;
    if(likeCount == 0){
        height = height - 38;
    }
    
    // 计算评论视图
    NSInteger count = [attentionModel.cardModel.comment_count integerValue];
    NSLog(@"%ld", count);
    if(count <= 3){
        height = height - 17*(3 - count + 1);
    }
    
    // 计算文本内容高度
    NSString *contentText = attentionModel.cardModel.desc;
    CGSize fontsize = CGSizeMake(250, 1000);
    UIFont *font = [UIFont systemFontOfSize:16];
    contentText = [contentText stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    CGRect frame = [contentText boundingRectWithSize:fontsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    height = height + frame.size.height;
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
//    AttentionModel *model = _data[indexPath.row];
    detailVC.attentionModel = _data[indexPath.row];
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
//    barButton.title = @"自定义";
//    barButton.tintColor = [UIColor redColor];
//    self.viewController.navigationItem.backBarButtonItem = barButton;
    
    [self.viewController.navigationController pushViewController:detailVC animated:YES];
    
    [self deselectRowAtIndexPath:indexPath animated:YES];
}
// 根据是否为热门视图控制器，返回会头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *hotHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    if(_isHotVC){
        hotHeaderView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height / 4);
        
        // 是热门视图的时候自定义头视图
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:hotHeaderView.bounds];
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.contentSize = CGSizeMake(_hotHeaderModel.items.count * self.bounds.size.width, hotHeaderView.bounds.size.height);
        [hotHeaderView addSubview:scrollView];
        
        [_hotHeaderModel.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            HeaderImageModel *headerModel = obj;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width*idx, 0, self.bounds.size.width, hotHeaderView.bounds.size.height - 8)];
            NSLog(@"%@", headerModel.image);
            [imageView setImageWithURL:[NSURL URLWithString:headerModel.image] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
            }];
            
            [scrollView addSubview:imageView];
        }];
        
        // 添加分页视图
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, hotHeaderView.bounds.size.height - 20, self.bounds.size.width, 10)];
        _pageControl.numberOfPages = _hotHeaderModel.items.count;
        _pageControl.currentPage = 0;
        [hotHeaderView addSubview:_pageControl];
        
    }
    return hotHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    if(_isHotVC){
        return self.bounds.size.height / 4;
    }
    return 0;
}

#pragma mark UIScrollView 协议
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"%f", targetContentOffset->x);
    _pageControl.currentPage = targetContentOffset->x / self.bounds.size.width;
}

#pragma 响应者
- (UIViewController *)viewController{
    UIResponder *next = self.nextResponder;
    do {
        if([next isKindOfClass:[UIViewController class]]){
            return (UIViewController *)next;
        };
        next = next.nextResponder;
    } while (next != nil);
    return nil;
}


@end
