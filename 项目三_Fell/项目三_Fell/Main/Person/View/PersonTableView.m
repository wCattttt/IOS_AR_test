//
//  PersonTableView.m
//  项目三_Fell
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PersonTableView.h"
#import "InfoCell.h"
#import "PostCell.h"
#import "AttentionCell.h"

#define line 6

@implementation PersonTableView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self _createView];
    }
    return self;
}

- (void)_createView{
    self.dataSource = self;
    self.delegate = self;
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return line;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            InfoCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell" owner:self options:nil] lastObject];
            cell.ownerModel = _ownerModel;
            return cell;
        }
            break;
            
        case 1:
        {
            AttentionCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AttentionCell" owner:self options:nil] lastObject];
            return cell;
        }
            break;
            
        case 2:
        {
            PostCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"PostCell" owner:self options:nil] lastObject];
            return cell;
        }
            break;
            
        case 3:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sportsCell"];
            cell.imageView.image = [UIImage imageNamed:@"tab_icon_sport_highlighted"];
            cell.textLabel.text = @"运动记录";
            return cell;
        }
            break;
            
        case 4:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"attentionCell"];
            cell.imageView.image = [UIImage imageNamed:@"icon_tag24R"];
            cell.textLabel.text = @"关注标签";
            return cell;
        }
            break;
            
        case 5:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"setCell"];
            cell.imageView.image = [UIImage imageNamed:@"icon_setting36G"];
            cell.textLabel.text = @"设置";
            return cell;
        }
            break;
            
        
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 66;
            break;

        case 1:
            return 50;
            break;
            
        case 2:
            return 100;
            break;
            
            
        default:
            return 40;
            break;
    }
}

@end
