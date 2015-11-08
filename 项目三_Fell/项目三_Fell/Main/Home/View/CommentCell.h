//
//  CommentCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentModel;
@interface CommentCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_ownerImageVIew;
    __weak IBOutlet UILabel *_nameLabel;
    __weak IBOutlet UILabel *_contentLabel;
    __weak IBOutlet UILabel *_timeLabel;
    
}
@property (nonatomic, strong) CommentModel *commentModel;

@end
