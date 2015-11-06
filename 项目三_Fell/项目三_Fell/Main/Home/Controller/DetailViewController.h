//
//  DetailViewController.h
//  项目三_Fell
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AttentionModel;
@interface DetailViewController : UIViewController

@property (nonatomic, strong) AttentionModel *attentionModel;
@property (nonatomic, retain) NSMutableArray *data;

@end
