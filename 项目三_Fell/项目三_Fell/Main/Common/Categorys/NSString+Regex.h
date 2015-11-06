//
//  NSString+Regex.h
//  01 Regex
//
//  Created by wei.chen on 15/4/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

//使用正则表达式去查找符合规则的字符串
- (NSArray *)findStringByRegex:(NSString *)regex;


@end
