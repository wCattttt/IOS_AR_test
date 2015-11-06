//
//  SendViewController.m
//  项目三_Fell
//
//  Created by imac on 15/11/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SendViewController.h"
#import "PhotoViewController.h"

#define collectionWidth ((self.view.bounds.size.width - 4*5) / 3)
#define collectionheight ((self.view.bounds.size.width - 4*5) / 3)

@interface SendViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSString *_identifier;
}
@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeAction)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sendAction)];
    
    [self _createView];
}

- (void)_createView{
//    CGFloat spaced = 5;
//    CGFloat imageWidth = 80;
//    [_imageData enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL *stop) {
//        NSInteger row = idx % 3;  // 列
//        NSInteger line = idx / 3;  // 行
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageWidth*row + spaced*row, imageWidth*line + spaced*line, imageWidth, imageWidth)];
//        imageView.image = _imageData[idx];
//        [self.view addSubview:imageView];7 p7
//    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(collectionWidth, collectionheight);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    CGRect frame = CGRectMake(0, 64, self.view.bounds.size.width, collectionWidth*(_imageData.count / 3 + 1) + 5*(_imageData.count / 3 + 1));
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor orangeColor];
    
    _identifier = @"photoCollectionViewCell";
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    [self.view addSubview:_collectionView];
    
}

#pragma 关闭页面
- (void)closeAction{

//    [[self viewController] dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (PhotoViewController *)viewController{
    UIResponder *next = self.nextResponder;
    do {
        if([next isKindOfClass:[PhotoViewController class]]){
            return (PhotoViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    return nil;
}

#pragma mark 发送微博
- (void)sendAction{
    
}

#pragma mark 同步微博
- (IBAction)KeepWeibo:(id)sender {
    
}


#pragma  mark  UICollection协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, collectionWidth, collectionheight)];
    
    imageView.image = _imageData[indexPath.row];
    //    cell.tag = indexPath.row;
    [cell addSubview:imageView];
    //    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}
// 四个边缘的间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 0, 5);
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
