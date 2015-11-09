//
//  MoreSignTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MoreSignTableView.h"
#import "MoreSignCell.h"

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
    [self registerNib:[UINib nibWithNibName:@"MoreSign" bundle:nil] forCellReuseIdentifier:_identifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreSignCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end
