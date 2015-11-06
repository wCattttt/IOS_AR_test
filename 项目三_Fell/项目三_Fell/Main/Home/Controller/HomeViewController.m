//
//  HomeViewController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "HomeViewController.h"
#import "AttentionViewController.h"
#import "HotViewController.h"
#import "FindViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
//    self = [super initWithViewControllers:viewControllers];
    if(self){
        AttentionViewController *attentionVC = [[AttentionViewController alloc] init];
        attentionVC.title = @"关注";
        HotViewController *hotVC = [[HotViewController alloc] init];
        hotVC.title = @"热门";
        FindViewController *findVC = [[FindViewController alloc] init];
        findVC.title = @"发现";
        
        NSArray *viewControllers = @[attentionVC, hotVC, findVC];
        self.viewControllers = viewControllers;
        
    }
    return self;
}



- (void)viewDidLoad {
    
//    AttentionViewController *attentionVC = [[AttentionViewController alloc] init];
//    attentionVC.title = @"关注";
//    HotViewController *hotVC = [[HotViewController alloc] init];
//    hotVC.title = @"热门";
//    FindViewController *findVC = [[FindViewController alloc] init];
//    findVC.title = @"发现";
//    
//    NSArray *viewControllers = @[attentionVC, hotVC, findVC];
//    self.viewControllers = viewControllers;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController  setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController  setNavigationBarHidden:NO animated:YES];
}

@end
