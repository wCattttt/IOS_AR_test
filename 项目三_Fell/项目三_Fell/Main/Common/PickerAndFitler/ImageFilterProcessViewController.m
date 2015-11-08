//
//  ImageFilterProcessViewController.m
//  MeiJiaLove
//
//  Created by Wu.weibin on 13-7-9.
//  Copyright (c) 2013年 Wu.weibin. All rights reserved.
//

#import "ImageFilterProcessViewController.h"
#import "ImageUtil.h"
#import "ColorMatrix.h"
#import "IphoneScreen.h"
#import "SendViewController.h"

@interface ImageFilterProcessViewController ()
{
//    NSMutableArray *_editImageDatas;
    NSInteger _index;
    UIImageView *_selectImageView;
}
@end

@implementation ImageFilterProcessViewController
@synthesize currentImage = currentImage, delegate = delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backView:(id)sender
{
//    [self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)fitlerDone:(id)sender
{
//    [self dismissViewControllerAnimated:NO completion:^{
//        [delegate imageFitlerProcessDone:rootImageView.image];
//    }];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Photo" bundle:nil];
    SendViewController *sendVC = [storyboard instantiateViewControllerWithIdentifier:@"sendViewController"];
    sendVC.imageData = _imgData;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sendVC];
    [self presentViewController:nav animated:YES completion:nil];
//    [self.navigationController pushViewController:sendVC animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 将传入的图片数组给_editImageDatas
//    _editImageDatas = [_imgData retain];
    
    _index = 0;
    
    _nextButton.layer.masksToBounds = YES;
    _nextButton.layer.cornerRadius = 15;
    
    [self createScrolleView];
    
    // 创建选择图片
    _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(51 + 15, 35, 10, 10)];
    _selectImageView.image = [[UIImage imageNamed:@"checkin_button_checkin148"] retain];
    [self.view addSubview:_selectImageView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [leftBtn setFrame:CGRectMake(10, 20, 34, 34)];
    [leftBtn addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton *rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"camera_btn_ok.png"] forState:UIControlStateNormal];
    [rightBtn setFrame:CGRectMake(270, 20, 34, 34)];
    [rightBtn addTarget:self action:@selector(fitlerDone:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.388 alpha:1.000]];
    rootImageView = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.width)];
    rootImageView.image = currentImage;
    [self.view addSubview:rootImageView];
    
    NSArray *arr = [NSArray arrayWithObjects:@"原图",@"LOMO",@"黑白",@"复古",@"哥特",@"锐色",@"淡雅",@"酒红",@"青柠",@"浪漫",@"光晕",@"蓝调",@"梦幻",@"夜色", nil];
    scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 100, self.view.bounds.size.width, 80)];
    scrollerView.backgroundColor = [UIColor clearColor];
    scrollerView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    scrollerView.showsHorizontalScrollIndicator = NO;
    scrollerView.showsVerticalScrollIndicator = NO;//关闭纵向滚动条
    scrollerView.bounces = NO;

    float x = 0.0 ;
    for(int i=0;i<14;i++)
    {
        x = 10 + 51*i;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setImageStyle:)];
        recognizer.numberOfTouchesRequired = 1;
        recognizer.numberOfTapsRequired = 1;
        recognizer.delegate = self;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, 53, 40, 23)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[arr objectAtIndex:i]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setFont:[UIFont systemFontOfSize:13.0f]];
        [label setTextColor:[UIColor whiteColor]];
        [label setUserInteractionEnabled:YES];
        [label setTag:i];
        [label addGestureRecognizer:recognizer];
        
        [scrollerView addSubview:label];
        [label release];
        
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 10, 40, 43)];
        [bgImageView setTag:i];
        [bgImageView addGestureRecognizer:recognizer];
        [bgImageView setUserInteractionEnabled:YES];
        UIImage *bgImage = [self changeImage:i imageView:nil];
        bgImageView.image = bgImage;
        [scrollerView addSubview:bgImageView];
        [bgImageView release];
        
        [recognizer release];

    }
    scrollerView.contentSize = CGSizeMake(x + 55, 80);
    [self.view addSubview:scrollerView];
    
	// Do any additional setup after loading the view.
}

// 点击滤镜类型，将图片保存
- (IBAction)setImageStyle:(UITapGestureRecognizer *)sender
{
    UIImage *image =   [self changeImage:sender.view.tag imageView:nil];
//    [_imgData removeObject:currentImage];
//    [_imgData insertObject:image atIndex:0];
    // 将处理好的图片和原来图片替换
//    NSInteger index = [_imgData indexOfObject:currentImage];
    if (_index <= _imgData.count -1) {
        [_imgData replaceObjectAtIndex:_index withObject:image];
        rootImageView.image = [image retain];
    }
//    currentImage = [image retain];
//    currentImage = [_imgData[index] retain];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIImage *)changeImage:(NSInteger)index imageView:(UIImageView *)imageView
{
    UIImage *image = nil;
    switch (index) {
        case 0:
        {
            return currentImage;
        }
            break;
        case 1:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_lomo];
        }
            break;
        case 2:
        {
           image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_heibai];
        }
            break;
        case 3:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_huajiu];
        }
            break;
        case 4:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_gete];
        }
            break;
        case 5:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_ruise];
        }
            break;
        case 6:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_danya];
        }
            break;
        case 7:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_jiuhong];
        }
            break;
        case 8:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_qingning];
        }
            break;
        case 9:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_langman];
        }
            break;
        case 10:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_guangyun];
        }
            break;
        case 11:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_landiao];
            
        }
            break;
        case 12:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_menghuan];
        
        }
            break;
        case 13:
        {
            image = [ImageUtil imageWithImage:currentImage withColorMatrix:colormatrix_yese];
            
        }
    }
    return image;
}

- (void)createScrolleView{
    
    CGFloat gap = 5;
    [_imgData enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL *stop) {
        //        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(idx*40 + gap*idx, 0, 40, 40)];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(idx*40 + gap*idx, 0, 40, 40)];
        [button addTarget:self action:@selector(imageAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = idx + 10;
//        UIImage *img = [self assetImage:idx];
        
        [button setImage:_imgData[idx] forState:UIControlStateNormal];
        [_scrollView addSubview:button];
    }];
    
    _scrollView.contentSize = CGSizeMake((gap + 40)*_imgData.count, 40);
    _scrollView.pagingEnabled = NO;
    
}

#pragma mrak 点击图片按钮
- (void)imageAction:(UIButton *)button{
//    NSLog(@"%ld", button.tag);
    
    _selectImageView.frame = CGRectMake(button.left + 20 + 45, button.top+30, 10, 10);
    _index = button.tag - 10;
    rootImageView.image = _imgData[button.tag - 10];
    currentImage = nil;
    [currentImage release];
    currentImage = [rootImageView.image retain];
//    CGRect frame = button.frame;
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x - 3, frame.origin.y - 3, frame.size.width+6, frame.size.height+6)];
//    bgView.backgroundColor = [UIColor blueColor];
////    [self.view insertSubview:bgView belowSubview:button];
//    [self.view insertSubview:bgView aboveSubview:button];
    
}

- (void)dealloc
{
    [super dealloc];
    scrollerView = nil;
    rootImageView = nil;
    _scrollView = nil;
    _nextButton = nil;
    _imgData = nil, [_imgData release];
    [currentImage release],currentImage  =nil;
    [_selectImageView release],_selectImageView=nil;
//    _editImageDatas = nil;
//    [_editImageDatas release];
}
@end
