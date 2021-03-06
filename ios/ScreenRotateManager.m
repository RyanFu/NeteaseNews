//
//  ScreenRotate.m
//  news
//
//  Created by 姜振华 on 2017/1/9.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "ScreenRotateManager.h"

@implementation ScreenRotateManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(forceOrientation:(UIInterfaceOrientation)orientation) {
  [ScreenRotateManager forceOrientation:orientation];
}

- (NSDictionary *)constantsToExport
{
  return @{
           @"interfaceOrientationUnknown":@(UIInterfaceOrientationPortrait),
           @"interfaceOrientationPortrait":@(UIInterfaceOrientationPortrait),
           @"interfaceOrientationPortraitUpsideDown":@(UIInterfaceOrientationPortraitUpsideDown),
           @"interfaceOrientationLandscapeLeft":@(UIInterfaceOrientationLandscapeLeft),
           @"interfaceOrientationLandscapeRight":@(UIInterfaceOrientationLandscapeRight)
           };
};

+ (void)forceOrientation:(UIInterfaceOrientation)orientation {
  if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[UIDevice currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
  }
}

+ (BOOL)isOrientationLandscape {
  if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
    return YES;
  }else {
    return NO;
  }
}

@end
