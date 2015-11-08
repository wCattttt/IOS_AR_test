//
//  DetailHeaderView.m
//  项目三_Fell
//
//  Created by imac on 15/11/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailHeaderView.h"
#import "UIView+FDCollapsibleConstraints.h"
#import "AttentionModel.h"
#import "CardModel.h"
#import "UIImageView+WebCache.h"
#import "OwnerModel.h"

@implementation DetailHeaderView

// 点击查看所有赞
- (IBAction)LikeList:(id)sender {
    
}

- (void)setAttentionModel:(AttentionModel *)attentionModel{
    _attentionModel = attentionModel;
    
    NSString *comtentString = _attentionModel.cardModel.desc;
    //    comtentString = [comtentString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    comtentString = [comtentString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    _contentLabel.text = comtentString;
    
    switch (_attentionModel.cardModel.pics.count) {
        case 1:
        {
            [self picOne];
            _twoImageView.fd_collapsed = YES;
            _threeImageView.fd_collapsed = YES;
            _fourImageView.fd_collapsed = YES;
            _fiveImageView.fd_collapsed = YES;
            _sixImageView.fd_collapsed = YES;
        }
            break;

        case 2:
        {
            [self picTwo];
            _threeImageView.fd_collapsed = YES;
            _fourImageView.fd_collapsed = YES;
            _fiveImageView.fd_collapsed = YES;
            _sixImageView.fd_collapsed = YES;
        }
            break;
            
        case 3:
        {
            [self picThree];
            _fourImageView.fd_collapsed = YES;
            _fiveImageView.fd_collapsed = YES;
            _sixImageView.fd_collapsed = YES;
        }
            break;
            
        case 4:
        {
            [self picFour];
            _fiveImageView.fd_collapsed = YES;
            _sixImageView.fd_collapsed = YES;
        }
            break;
            
        case 5:
        {
            [self picFive];
            _sixImageView.fd_collapsed = YES;
        }
            break;
            
        case 6:
        {
            [self picSix];
        }
            break;
            
            
        default:
            break;
    }
    
    // 标签
    NSMutableString *tagName = [NSMutableString string];
    [_attentionModel.cardModel.tags enumerateObjectsUsingBlock:^(NSDictionary *tagDic, NSUInteger idx, BOOL *stop) {
        [tagName appendFormat:@"#%@  ", tagDic[@"bname"]];
    }];
    _tagLabel.text = tagName;
    
    // 点赞视图 
    if(_attentionModel.cardModel.likeOwners.count >= 6){
        [self createLikeView:6];
    }else{
        [self createLikeView:_attentionModel.cardModel.likeOwners.count];
    }
    
}

- (void)createLikeView:(NSInteger)count{
#warning 添加点击事件
    // 给每个头像添加点击事件
    if(count == 0){
        _likeView.hidden = YES;
        _likeView.fd_collapsed = YES;
    }
    
    for(int i = 1; i<=count; i++){
        UIImageView *likeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30 * i + i*5, 0, 30, 30)];
        likeImageView.layer.masksToBounds = YES;
        likeImageView.layer.cornerRadius = 15;
        OwnerModel *ownerModel = _attentionModel.cardModel.likeOwners[i-1];
        [likeImageView setImageWithURL:[NSURL URLWithString:ownerModel.avatar] placeholderImage:[UIImage imageNamed:@"tint_CCC"]];
        [_likeView addSubview:likeImageView];
    }
}
             
- (void)picOne{
    [_oneImageView setImageWithURL:[NSURL URLWithString:[_attentionModel.cardModel.pics[0] objectForKey:@"uri"]] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    }];
    
}
- (void)picTwo{
    [self picOne];
    [_twoImageView setImageWithURL:[NSURL URLWithString:[_attentionModel.cardModel.pics[1] objectForKey:@"uri"]] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    }];
}
- (void)picThree{
    [self picTwo];
    [_threeImageView setImageWithURL:[NSURL URLWithString:[_attentionModel.cardModel.pics[2] objectForKey:@"uri"]] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    }];
}
- (void)picFour{
    [self picThree];
    [_fourImageView setImageWithURL:[NSURL URLWithString:[_attentionModel.cardModel.pics[3] objectForKey:@"uri"]] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    }];
}
- (void)picFive{
    [self picFour];
    [_fiveImageView setImageWithURL:[NSURL URLWithString:[_attentionModel.cardModel.pics[4] objectForKey:@"uri"]] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    }];
}
- (void)picSix{
    [self picFive];
    [_sixImageView setImageWithURL:[NSURL URLWithString:[_attentionModel.cardModel.pics[5] objectForKey:@"uri"]] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    }];
}
             
@end
