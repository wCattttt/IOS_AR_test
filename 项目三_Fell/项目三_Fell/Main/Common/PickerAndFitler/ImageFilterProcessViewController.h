//
//  ImageFilterProcessViewController.h
//  MeiJiaLove
//
//  Created by Wu.weibin on 13-7-9.
//  Copyright (c) 2013年 Wu.weibin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ImageFitlerProcessDelegate;
@interface ImageFilterProcessViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UIImageView *rootImageView;
    UIScrollView *scrollerView;
    UIImage *currentImage;
    id <ImageFitlerProcessDelegate> delegate;
    
    __weak IBOutlet UIScrollView *_scrollView;
    
    
    __weak IBOutlet UIButton *_nextButton;
    
}

@property (nonatomic, retain) NSMutableArray *imgData;

@property (nonatomic,assign) BOOL isEdit;

@property(nonatomic,assign) id<ImageFitlerProcessDelegate> delegate;
@property(nonatomic,retain)UIImage *currentImage;
@end

@protocol ImageFitlerProcessDelegate <NSObject>

- (void)imageFitlerProcessDone:(UIImage *)image;
@end
