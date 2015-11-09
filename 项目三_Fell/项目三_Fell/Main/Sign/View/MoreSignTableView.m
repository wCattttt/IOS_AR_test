//
//  MoreSignTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MoreSignTableView.h"
#import "MoreSignCell.h"
#import "SignModel.h"

@implementation MoreSignTableView
{
    NSString *_identifier;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self _initView];
    }
    return self;
}

- (void)_initView{
    self.dataSource = self;
    self.delegate = self;
    
    _identifier = @"MoreSignCell";
    [self registerNib:[UINib nibWithNibName:@"MoreSignCell" bundle:nil] forCellReuseIdentifier:_identifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreSignCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    cell.moreSignModel = _data[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 76;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text = @"热门打卡";
    titleLabel.textColor = [UIColor grayColor];
    return titleLabel;
}


@end
