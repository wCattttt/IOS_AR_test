//
//  DetailHeaderView.h
//  项目三_Fell
//
//  Created by imac on 15/11/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AttentionModel;
@interface DetailHeaderView : UIView
{
    __weak IBOutlet UILabel *_contentLabel;
    __weak IBOutlet UIImageView *_oneImageView;
    __weak IBOutlet UIImageView *_twoImageView;
    __weak IBOutlet UIImageView *_threeImageView;
    __weak IBOutlet UIImageView *_fourImageView;
    __weak IBOutlet UIImageView *_fiveImageView;
    __weak IBOutlet UIImageView *_sixImageView;
    
    __weak IBOutlet UILabel *_tagLabel;
    
    __weak IBOutlet UIView *_likeView;
    
    __weak IBOutlet UIButton *_likeButton;
    
}

@property (nonatomic, strong) AttentionModel *attentionModel;

@end
