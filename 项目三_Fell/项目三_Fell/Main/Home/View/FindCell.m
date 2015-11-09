//
//  FindCell.m
//  项目三_Fell
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FindCell.h"
#import "UIImageView+WebCache.h"
#import "CardModel.h"
#import "OwnerModel.h"

@implementation FindCell

- (void)awakeFromNib {
    _ownerImageView.layer.masksToBounds = YES;
    _ownerImageView.layer.cornerRadius = 20;
}

- (IBAction)Attention:(id)sender {
}

- (IBAction)Like:(id)sender {
    
}


- (void)setCardModel:(CardModel *)cardModel{
    _cardModel = cardModel;
    
    [_ownerImageView setImageWithURL:[NSURL URLWithString:_cardModel.ownerModel.avatar] placeholderImage:[UIImage imageNamed:@"cbutton_float64@2x"]];
    _nameLabel.text = _cardModel.ownerModel.nick;
    if(_cardModel.loc.length == 0){
        _locationImageView.hidden = YES;
        _timeLabel.hidden = YES;
    }else{
        _timeLabel.text = _cardModel.loc;
    }
    [_contentImageView setImageWithURL:[NSURL URLWithString:[_cardModel.pics firstObject][@"uri"]] placeholderImage:[UIImage imageNamed:@"tint_CCC"]];
    [_likeButton setTitle:[_cardModel.very_count stringValue] forState:UIControlStateNormal];
    
}

@end
