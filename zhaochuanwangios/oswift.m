//
//  oswift.m
//  zhaochuanwangios
//
//  Created by wangxiaoqing on 15/7/23.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPush.h"
#import "oswift.h"

@implementation oswift

+(void)sendLocalMessage:(NSString*)sMsg
{
    NSLog(@"测试本地通知啦！！！");
    NSDate *fireDate = [[NSDate new] dateByAddingTimeInterval:5];
    [BPush localNotification:fireDate alertBody:sMsg badge:1 withFirstAction:@"打开" withSecondAction:@"关闭" userInfo:nil soundName:nil region:nil regionTriggersOnce:YES category:nil];
    
}

@end