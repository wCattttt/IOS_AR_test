//
//  SignViewController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SignViewController.h"
#import "MoreSignViewController.h"

@interface SignViewController ()

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _addSignButton.layer.masksToBounds = YES;
    _addSignButton.layer.cornerRadius = 20;
    
}

- (IBAction)AddSign:(id)sender {
    MoreSignViewController *moreSignVC = [[MoreSignViewController alloc] init];
    moreSignVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:moreSignVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
