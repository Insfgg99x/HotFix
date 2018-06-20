//
//  ViewController.m
//  FIX
//
//  Created by xgf on 2018/6/20.
//  Copyright © 2018年 xgf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self join:@"Steve" b:@"Jobs"];
    [self join:@"Steve" b:nil];
}
- (void)join:(NSString *)a b:(NSString *)b {
    NSArray *tmp = @[a,b,@"Good Job!"];
    NSString *c = [tmp componentsJoinedByString:@" "];
    printf("%s\n",[c UTF8String]);
}

@end
