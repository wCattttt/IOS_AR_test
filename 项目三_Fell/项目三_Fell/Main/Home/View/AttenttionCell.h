//
//  AttenttionCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/1.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AttentionModel;

@interface AttenttionCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_userImageView;
    __weak IBOutlet UILabel *_nickLabel;
    __weak IBOutlet UILabel *_timeLabel;
    __weak IBOutlet UIImageView *_comtentImageView;
    __weak IBOutlet UILabel *_comtentLabel;
    __weak IBOutlet UILabel *_tagLabel;
    __weak IBOutlet UIView *_likeView;
    __weak IBOutlet UILabel *_commentOneLabel;
    __weak IBOutlet UILabel *_commentTwoLabel;
    __weak IBOutlet UILabel *_commentThreeLabel;
    __weak IBOutlet UILabel *_allCommentLabel;
    
    
    __weak IBOutlet UIView *_cmOneView;
    __weak IBOutlet UIView *_cmTwoView;
    __weak IBOutlet UIView *_cmThreeView;
    
    __weak IBOutlet UIView *_cmAllView;
    
    __weak IBOutlet UITextField *_commentTextField;
    __weak IBOutlet UILabel *_locationLabel;
    
    __weak IBOutlet UIImageView *_timeImageView;
    __weak IBOutlet UIImageView *_locationImageView;
    
    __weak IBOutlet UIImageView *_commentImageView;

    __weak IBOutlet UIButton *_attentionButton;
    
    __weak IBOutlet UIButton *_shareButton;
    
    __weak IBOutlet UIButton *_likeButton;
    
    __weak IBOutlet UIImageView *_moreImageView;
    
}


- (IBAction)moreLikeButton:(id)sender;



@property (nonatomic, strong) AttentionModel *attentionModel;

@end
