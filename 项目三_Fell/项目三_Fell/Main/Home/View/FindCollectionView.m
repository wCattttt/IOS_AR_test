//
//  FindCollectionView.m
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FindCollectionView.h"
#import "FindCell.h"
#import "CollectionHeaderView.h"

#define collectionWidth (([UIScreen mainScreen].bounds.size.width - 3*10) / 2)
#define collectionHeight ((([UIScreen mainScreen].bounds.size.width - 3*10) / 2) + 70)

@implementation FindCollectionView
{
    NSString *_identifier;
}

- (instancetype)initWithFrame:(CGRect)frame{
//    ((self.bounds.size.width - 3*10) / 2)
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(collectionWidth, collectionHeight);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;

    // 设置头视图范围
    layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*3/5);
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if(self){
        self.dataSource = self;
        self.delegate = self;
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tint_CCC"]];
        
        // 头视图注册
//        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"findCollectionHeader"];
        [self registerNib:[UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"findCollectionHeader"];
        
        _identifier = @"findCollectionCell";
        [self registerNib:[UINib nibWithNibName:@"FindCell" bundle:nil] forCellWithReuseIdentifier:_identifier];
    }
    return self;
}

#pragma  mark  UICollection协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FindCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.cardModel = _data[indexPath.row];
    return cell;
}
// 四个边缘的间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 0, 5);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CollectionHeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"findCollectionHeader" forIndexPath:indexPath];
    headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tint_CCC"]];
    
    return headView;
}


@end
