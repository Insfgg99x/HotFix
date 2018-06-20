//
//  HotFix.h
//  FIX
//
//  Created by xgf on 2018/6/20.
//  Copyright © 2018年 xgf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotFix : NSObject

+ (instancetype)shared;

- (void)fix:(NSString *)js;

@end
