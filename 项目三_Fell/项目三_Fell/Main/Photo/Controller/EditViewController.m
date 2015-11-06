//
//  EditViewController.m
//  项目三_Fell
//
//  Created by imac on 15/11/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "EditViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "SendViewController.h"

@interface EditViewController ()
{
    NSMutableArray *_data;
}
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将iamgeData中的asset转成image
    _data = @[].mutableCopy;
    for(int i=0; i<_imageData.count; i++){
        [_data addObject:[self assetImage:i]];
    }
    

    
    _nextButton.layer.masksToBounds = YES;
    _nextButton.layer.cornerRadius = 15;
    
    [self createScrolleView];
    
    _editImageVIew.image = [self assetImage:0];
    [self _createFilter];
}

- (void)_createFilter{
//    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
//    [picker setIsSingle:YES];
//    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//
//    [picker setCustomDelegate:self];
//    [self presentViewController:picker animated:YES completion:nil];
    
    ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
    [fitler setDelegate:self];
    fitler.currentImage = _editImageVIew.image;
    [self presentViewController:fitler animated:YES completion:nil];
    
}

- (void)createScrolleView{
    
    CGFloat gap = 5;
    [_imageData enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL *stop) {
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(idx*40 + gap*idx, 0, 40, 40)];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(idx*40 + gap*idx, 0, 40, 40)];
        [button addTarget:self action:@selector(imageAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = idx;
        UIImage *img = [self assetImage:idx];
        
        [button setImage:img forState:UIControlStateNormal];
        [_scrollView addSubview:button];
    }];
    
    _scrollView.contentSize = CGSizeMake((gap + 40)*_imageData.count, 40);
    _scrollView.pagingEnabled = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    _imageData = nil;
    [_scrollView removeFromSuperview];
    _scrollView = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 下一步
- (IBAction)Next:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Photo" bundle:nil];
    SendViewController *sendVC = [storyboard instantiateViewControllerWithIdentifier:@"sendViewController"];
    sendVC.imageData = _data;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sendVC];
    [self presentViewController:nav animated:YES completion:nil];

    [self _createFilter];
}


#pragma mrak 点击图片按钮
- (void)imageAction:(UIButton *)button{
    NSLog(@"%ld", button.tag);
    _editImageVIew.image = [self assetImage:button.tag];
}


- (UIImage *)assetImage:(NSInteger)index{
    //1.取得资源对象
    ALAsset *asset = _imageData[index];
    
    //2.取得资源的缩略图 ：thumbnail
    //        CGImageRef cgImg = [asset thumbnail];
    
    //aspectRatioThumbnail 取得原图
    CGImageRef fullImg = [asset aspectRatioThumbnail];
    
    UIImage *img = [UIImage imageWithCGImage:fullImg];
    return img;
}

#pragma mark 滤镜协议
//- (void)cameraPhoto:(UIImage *)image  //选择完图片
//{
//    ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
//    [fitler setDelegate:self];
//    fitler.currentImage = image;
//    [self presentViewController:fitler animated:YES completion:nil];
//    //    [fitler release];
//}
- (void)imageFitlerProcessDone:(UIImage *)image //图片处理完
{
    _editImageVIew.image = image;
}
- (void)cancelCamera{
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
    //UIStatusBarStyleDefault = 0 黑色文字，浅色背景时使用
    //UIStatusBarStyleLightContent = 1 白色文字，深色背景时使用
}
//- (BOOL)prefersStatusBarHidden
//{
//    return YES; // 返回NO表示要显示，返回YES将hiden
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
