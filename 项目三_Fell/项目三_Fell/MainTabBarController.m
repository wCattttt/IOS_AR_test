//
//  MainTabBarController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MainTabBarController.h"
#import "FellNavigationController.h"
#import "HomeViewController.h"
#import "MotionViewController.h"
#import "PhotoViewController.h"
#import "PersonViewController.h"
#import "SignViewController.h"

@interface MainTabBarController ()<UIActionSheetDelegate>
{
    UIButton *_selectButton;
}
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createViewControllers];
    
    [self _createTabbar];
}

- (void)_createViewControllers{
    
    // tab_icon_home
    NSArray *storyboards = @[@"Home", @"Sign", @"Motion", @"Person"];
    
    NSMutableArray *viewControllers = @[].mutableCopy;
    [storyboards enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        UINavigationController *nav = [storyboard instantiateInitialViewController];
        [viewControllers addObject:nav];
    }];
    self.viewControllers = viewControllers;
    
}


// 创建标签按钮
- (void)_createTabbar{
    NSArray *imageArray = @[
                            @"tab_icon_home",
                            @"tab_icon_card",
//                            @"icon_camera108C",
                            @"tab_icon_sport",
                            @"tab_icon_person"];//tab_icon_card_highlighted

    NSArray *highlightImages = @[
                            @"tab_icon_home_highlighted",
                            @"tab_icon_card_highlighted",
//                            @"icon_camera108C",
                            @"tab_icon_sport_highlighted",
                            @"tab_icon_person_highlighted"];
    
    CGFloat itemwidth = self.tabBar.frame.size.width/(imageArray.count + 1);
    for(int i=0; i<imageArray.count; i++){
        CGRect frame = CGRectMake(itemwidth*i, 0, itemwidth, self.tabBar.frame.size.height);
        if(i >= 2){
            frame = CGRectMake(itemwidth*(i + 1), 0, itemwidth, self.tabBar.frame.size.height);
        }
        UIButton *button = [[UIButton alloc]initWithFrame:frame];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:highlightImages[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
//        if(i >= 2){
//            button.tag = i+1;
//        }
        [self.tabBar addSubview:button];
        if(button.tag == 0){
            button.selected = YES;
            _selectButton = button;
        }
    }
    
    // 添加拍照按钮
    UIButton *photoButton = [[UIButton alloc] initWithFrame:CGRectMake(itemwidth*2, 0, itemwidth, self.tabBar.frame.size.height)];
    [photoButton setImage:[UIImage imageNamed:@"icon_camera108C"] forState:UIControlStateNormal];
    [photoButton addTarget:self action:@selector(photoAction) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:photoButton];

}

- (void)photoAction{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"选择照片", nil];
    [actionSheet showInView:self.view];
}

#pragma mark UIActionSheet协议方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            // 拍照
//            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
//            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
            break;
            
        case 1:
        {
            // 选取相片
            [self selectPhoto];
        }
            break;
            
        default:
            break;
    }
}


- (void)selectPhoto{
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.hidesBottomBarWhenPushed = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:photoVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSArray *subviews = self.tabBar.subviews;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if([view isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [view removeFromSuperview];
        }
    }];
    
}

#pragma mark tabbar按钮点击方法
- (void)buttonAction:(UIButton *)button{
    self.selectedIndex = button.tag;
//    if(button.tag == 2){
//        return;
//    }
    
    if(_selectButton == button){
        return ;
    }else{
        
        button.selected = YES;
        _selectButton.selected = NO;
        
        _selectButton = button;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
