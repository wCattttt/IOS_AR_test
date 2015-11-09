//
//  CreateTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CreateTableView.h"

@implementation CreateTableView
{
    NSString *_identifier;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self _createView];
    }
    return self;
}

- (void)_createView{
    self.dataSource = self;
    self.delegate = self;
    _identifier = @"signCell";
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:_identifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"goal_tool_head_icon"];
            cell.textLabel.text = @"工具打卡";
            cell.textLabel.textColor = [UIColor blueColor];
            break;

        case 1:
            cell.imageView.image = [UIImage imageNamed:@"goal_icon_type_normal"];
            cell.textLabel.text = @"快速打卡";
            cell.textLabel.textColor = [UIColor blueColor];
            break;
            
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"goal_icon_type_photo"];
            cell.textLabel.text = @"图片打卡";
            cell.textLabel.textColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击单元格 %ld", indexPath.row);
}

@end
