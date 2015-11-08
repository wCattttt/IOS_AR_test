//
//  PhotoViewController.m
//  项目三_Fell
//
//  Created by imac on 15/10/31.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PhotoViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define collectionWidth ((self.view.bounds.size.width - 4*5) / 3)
#define collectionheight ((self.view.bounds.size.width - 4*5) / 3)

@interface PhotoViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSString *_identifier;
    NSMutableArray *_data;
    NSMutableArray *_selectData;
    NSMutableArray *_imageData;
    ALAssetsLibrary *libary;
    UIButton *rightButton;
}
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"选择照片";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(closeAction)];
    
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 60, 25);
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    rightButton.backgroundColor = [UIColor grayColor];
    rightButton.layer.masksToBounds = YES;
    rightButton.layer.cornerRadius = 12;
    [rightButton addTarget:self action:@selector(flishAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    [self achivePhotoLibrary];
    
    [self _createView];
}

#pragma mark 取得系统所有照片
- (void)achivePhotoLibrary{
    _data = [NSMutableArray array];
    _selectData = [NSMutableArray array];
    
    //1.相册库
    libary = [[ALAssetsLibrary alloc] init];
    
    
    //2.通过相册库遍历所有的文件夹
    [libary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group != nil) {
            //3.通过文件夹遍历其中所有的照片、视频
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result != nil) {
                    [_data addObject:result];
                }
            }];
            
            //数据读取完之后
            [_collectionView reloadData];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"error:%@",error);
    }];

    
}

- (void)_createView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(collectionWidth, collectionheight);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _identifier = @"photoCollectionViewCell";
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    [self.view addSubview:_collectionView];
}

#pragma  mark  UICollection协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, collectionWidth, collectionheight)];
    //1.取得资源对象
    ALAsset *asset = _data[indexPath.row];
    
    //2.取得资源的缩略图 ：thumbnail
    CGImageRef cgImg = [asset thumbnail];
    
    //aspectRatioThumbnail 取得原图
    //    CGImageRef fullImg = [asset aspectRatioThumbnail];
    
    UIImage *img = [UIImage imageWithCGImage:cgImg];
    imageView.image = img;
   //    cell.tag = indexPath.row;
    [cell addSubview:imageView];
//    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}
// 四个边缘的间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 0, 5);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    ALAsset *asset = _data[indexPath.row];
    //判断单元格上的图片是否选择了
    if (cell.alpha == 0.5 ) {  //已选中
        //取消选择，取消打钩
        cell.alpha = 1;
        
        [_selectData removeObject:asset];
        
    } else {  //没有选中
        //选择这个照片， 单元格打钩
        if(_selectData.count >= 6){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"不好意思" message:@"最多只能选6张图" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alertView show];
            return ;
        }
        
        [UIView animateWithDuration:0.2 animations:^{
            cell.alpha = 0.5;
            cell.transform = CGAffineTransformMakeScale(1.1, 1.1);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                cell.transform = CGAffineTransformMakeScale(1, 1);
            }];
        }];

        [_selectData addObject:asset];
    }
    
    //    cell.alpha = 0.5;
//    NSLog(@"原图的尺寸：%f,%f",img.size.width,img.size.height);
    
    if(_selectData.count != 0){
//        rightButton.selected = YES;
        rightButton.backgroundColor = [UIColor blueColor];
    }else{
//        rightButton.selected = NO;
        rightButton.backgroundColor = [UIColor grayColor];
    }
    
}


// 点击取消
- (void)closeAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 完成按钮
- (void)flishAction{
    
    
    _imageData = @[].mutableCopy;
    
    for(int i=0; i<_selectData.count; i++){
        [_imageData addObject:[self assetImage:i]];
    }
    
//    ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
//    [fitler setDelegate:self];
//    fitler.currentImage = _imageData[0];
//    [self presentViewController:fitler animated:YES completion:nil];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Photo" bundle:nil];
    ImageFilterProcessViewController *fitler = [storyboard instantiateViewControllerWithIdentifier:@"ImageFilterProcessViewController"];
    fitler.imgData = _imageData;
    [fitler setDelegate:self];
    fitler.currentImage = _imageData[0];
    
//    UINavigationController *
    [self presentViewController:fitler animated:YES completion:nil];
}

- (void)imageFitlerProcessDone:(UIImage *)image{
    NSLog(@"图片处理完成");
}

- (UIImage *)assetImage:(NSInteger)index{
    //1.取得资源对象
    ALAsset *asset = _selectData[index];
    
    //2.取得资源的缩略图 ：thumbnail
    //        CGImageRef cgImg = [asset thumbnail];
    
    //aspectRatioThumbnail 取得原图
    CGImageRef fullImg = [asset aspectRatioThumbnail];
    
    UIImage *img = [UIImage imageWithCGImage:fullImg];
    return img;
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
