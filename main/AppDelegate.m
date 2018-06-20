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
    //sync downloading js here
    //App启动时，主动同步请求服务端修复脚本，并执行修复方案
    NSString *js = @"fixInstanceMethodReplace('ViewController', 'join:b:', function(instance, originInvocation, originArguments){ \
    console.log(instance);\
    console.log(originInvocation);\
    console.log(originArguments);\
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


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
