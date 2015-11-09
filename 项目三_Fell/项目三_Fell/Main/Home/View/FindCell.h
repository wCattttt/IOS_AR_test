//
//  FindCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardModel;
@interface FindCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *_ownerImageView;
    __weak IBOutlet UILabel *_nameLabel;
    
    __weak IBOutlet UILabel *_timeLabel;
    __weak IBOutlet UIImageView *_contentImageView;
    
    __weak IBOutlet UIButton *_likeButton;
    __weak IBOutlet UIImageView *_locationImageView;
    
}
@property (nonatomic, strong) CardModel *cardModel;

@end
