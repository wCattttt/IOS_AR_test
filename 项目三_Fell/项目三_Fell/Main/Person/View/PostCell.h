//
//  PostCell.h
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UITableViewCell
{
    __weak IBOutlet UILabel *_postLabel;
    __weak IBOutlet UIImageView *_postOne;

    __weak IBOutlet UIImageView *_postTwo;
    __weak IBOutlet UIImageView *_postThree;
    __weak IBOutlet UIImageView *_postFour;
}



@end
