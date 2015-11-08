//
//  SendViewController.m
//  项目三_Fell
//
//  Created by imac on 15/11/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SendViewController.h"
#import "PhotoViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#define collectionWidth ((self.view.bounds.size.width - 4*5) / 3)
#define collectionheight ((self.view.bounds.size.width - 4*5) / 3)

@interface SendViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MKMapViewDelegate,CLLocationManagerDelegate>
{
    UICollectionView *_collectionView;
    NSString *_identifier;
    MKMapView *_mapView;
    CLLocationManager *_locationManager;
    CLLocation *_location;
}
@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeAction)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sendAction)];
    
    [self _createView];
    
    [self position];
}

- (void)_createView{
    // 创建添加标签视图
    UIView *tagView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 38)];
    tagView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tint_CCC"]];
    [self.view addSubview:tagView];
    
    // 标签
    UIImageView *tagImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, (tagView.height - 10)/2 , 10, 10)];
    tagImageView.image = [UIImage imageNamed:@"icon_tag24R"];
    [tagView addSubview:tagImageView];
    
    // 增加按钮 icon_addTags
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(tagImageView.right + 8, (tagView.height - 30) / 2, 150 , 30)];
    [button setImage:[UIImage imageNamed:@"icon_addTags"] forState:UIControlStateNormal];
    button.font = [UIFont systemFontOfSize:14];
    [button setTitle:@" 至少添加一个标签" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addTagAction) forControlEvents:UIControlEventTouchUpInside];
    [tagView addSubview:button];
    
    
    // 创建CollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(collectionWidth, collectionheight);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    CGRect frame = CGRectMake(0, tagView.bottom + 8, self.view.bounds.size.width, collectionWidth*(_imageData.count / 4+1) + 5*(_imageData.count / 3 + 1));
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _identifier = @"photoCollectionViewCell";
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    [self.view addSubview:_collectionView];
    
    // 创建提示label
    UILabel *message = [[UILabel alloc] initWithFrame:CGRectMake(0, _collectionView.bottom, self.view.bounds.size.width, 30)];
    message.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tint_CCC"]];
    message.text = @"提示: 最多只能输入140个字符";
    message.font = [UIFont systemFontOfSize:14];
    message.textColor = [UIColor grayColor];
    [self.view addSubview:message];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 创建输入框
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, message.bottom + 10, self.view.bounds.size.width, self.view.bounds.size.height - message.bottom)];
    UIImage *image = [UIImage imageNamed:@"sutroEdgeBurn"];
//    image.resizingMode = UIImageResizingModeStretch;
    UIEdgeInsets insets = {10,10,10,10};
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];
    textView.backgroundColor = [UIColor colorWithPatternImage:image];
    textView.font = [UIFont systemFontOfSize:17];
//    [self.view addSubview:textView];
    [self.view insertSubview:textView atIndex:0];
    
}

#pragma  mark 添加标签按钮
- (void)addTagAction{
    NSLog(@"tinajia biaoqian");
}

#pragma 关闭页面
- (void)closeAction{

//    [[self viewController] dismissViewControllerAnimated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
    if ([self respondsToSelector:@selector(presentingViewController)]){
        [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self.parentViewController.parentViewController.parentViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
}

/*
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
 */

#pragma mark 发送数据
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


#pragma mark --- CoreLocation 定位
- (void)position{
    // 加载显示定位的视图
    if(_locationManager == nil){
        _locationManager = [[CLLocationManager alloc] init];
        
        // 设置精准度
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        _locationManager.delegate = self;
        
        if([[UIDevice currentDevice].systemVersion floatValue] > 8.0){
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    
    // 开始定位
    [_locationManager startUpdatingLocation];
}

#pragma mark --- 定位的协议方法
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    NSLog(@"%@", locations);
    _location = locations.firstObject;
    
    CLLocationCoordinate2D locationCoordinate = _location.coordinate;
    //    _textView.text = [NSString stringWithFormat:@"latitude:%f, longitude:%f", locationCoordinate.latitude, locationCoordinate.longitude];
    [_locationManager stopUpdatingLocation];
    
    // 根据经纬度进行反编码
    // 根据IOS自带的类反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:_location completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error != nil){
//            [self showError:@"位置请求失败"];
        }else{
            CLPlacemark *placemark = [placemarks firstObject];
            //            NSLog(@"%@", placemark);
            //            NSLog(@"thoroughfare  %@", [placemark thoroughfare]);      // 街道地址
            NSLog(@"name  %@", [placemark name]);   // 详细地址
            NSString *addressName = [placemark name];
            _locationLabel.text = addressName;
            _locationLabel.textColor = [UIColor blueColor];
            //            NSLog(@"locality  %@", [placemark locality]);   // 行政区
            //            NSLog(@"location  %@", [placemark location]); // 当地时间
        }
    }];
    
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
