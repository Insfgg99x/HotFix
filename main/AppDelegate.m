//
//  AppDelegate.m
//  FIX
//
//  Created by xgf on 2018/6/20.
//  Copyright © 2018年 xgf. All rights reserved.
//

#import "AppDelegate.h"
#import "HotFix.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*sync downloading js here
    App启动时，主动同步请求服务端修复脚本，并执行修复方案
    这个里的js应该是通过同步的方式请求接口得到的，如
    调用获取修复脚本的接口
     NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://xxxx/hotfix?access_token=xxxx"]];
     NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
     NSString *js = json[@"hotfix_js"];
     if(js) {
        [[HotFix shared] fix:js];
     }*/
    //这是同步下载得到的js脚本字符串，假设我们从服务器获得了这样一个脚本，用于修复ViewController的join:b:方法由于nil导致崩溃。
    NSString *js = @"fixInstanceMethodReplace('ViewController', 'join:b:', function(instance, originInvocation, originArguments){ \
        if (!originArguments[0] || !originArguments[1]) { \
            console.log('nil goes here'); \
        } else { \
            runInvocation(originInvocation); \
        } \
    });";
    if(js) {
        [[HotFix shared] fix:js];
    }
    //do something else
    return YES;
}

@end
