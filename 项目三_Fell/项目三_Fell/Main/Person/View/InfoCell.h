//
//  InfoCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OwnerModel;
@interface InfoCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_personImageView;
    
    __weak IBOutlet UILabel *_nameLabel;
    __weak IBOutlet UILabel *_ageLabel;
    __weak IBOutlet UILabel *_likeLabel;
    
}

@property (nonatomic, strong) OwnerModel *ownerModel;

@end
