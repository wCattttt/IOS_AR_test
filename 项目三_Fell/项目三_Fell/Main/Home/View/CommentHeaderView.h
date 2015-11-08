//
//  CommentHeaderView.h
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailCommentModel;
@interface CommentHeaderView : UIView
{
    __weak IBOutlet UIImageView *_ownerImageView;
    __weak IBOutlet UILabel *_nameLabel;
    
    __weak IBOutlet UILabel *_timeLabel;
   
    __weak IBOutlet UILabel *_contentLabel;
    
    
}

@property (nonatomic, strong) DetailCommentModel *detailCommentModel;

@end
