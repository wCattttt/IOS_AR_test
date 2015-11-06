//
//  EditViewController.h
//  项目三_Fell
//
//  Created by imac on 15/11/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFilterProcessViewController.h"

@interface EditViewController : UIViewController<ImageFitlerProcessDelegate>
{
    __weak IBOutlet UIButton *_nextButton;
    __weak IBOutlet UIScrollView *_scrollView;

}
@property (weak, nonatomic) IBOutlet UIImageView *editImageVIew;

@property (nonatomic, retain) NSArray *imageData;


@end
