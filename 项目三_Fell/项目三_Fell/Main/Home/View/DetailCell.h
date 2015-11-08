//
//  DetailCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailCommentModel;
@interface DetailCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_ownerImageVIew;
    __weak IBOutlet UILabel *_nameLabel;
    
    __weak IBOutlet UILabel *_timeLabel;
    
    __weak IBOutlet UILabel *_replyLabel;
    __weak IBOutlet UIImageView *_replyImageVIew;
    __weak IBOutlet UILabel *_contextLabel;
    __weak IBOutlet UIView *_bgView;
    __weak IBOutlet UIView *_replyOneView;
    
    __weak IBOutlet UIView *_replyTwoView;
    
    __weak IBOutlet UIView *_replyThreeView;
    
    __weak IBOutlet UIView *_allreplyView;
    
    __weak IBOutlet UILabel *_userOneLabel;
    
    __weak IBOutlet UILabel *_commentOneLabel;
    
    __weak IBOutlet UILabel *_userTwoLabel;
    
    __weak IBOutlet UILabel *_commentTwoLabel;
    
    __weak IBOutlet UILabel *_userThreeLabel;
    
    __weak IBOutlet UILabel *_commentThreeLabel;
    
    __weak IBOutlet UILabel *_allreplyLabel;
    

    
}

@property (nonatomic, strong) DetailCommentModel *detailCommentModel;

@end
