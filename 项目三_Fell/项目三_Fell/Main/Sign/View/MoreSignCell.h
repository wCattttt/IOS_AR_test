//
//  MoreSignCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoreSignModel;

@interface MoreSignCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imageView;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_personNumLabel;
    __weak IBOutlet UILabel *_signWayLabel;
    
}

@property (nonatomic, strong) MoreSignModel *moreSignModel;

@end
