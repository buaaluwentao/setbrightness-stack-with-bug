//
//  ScreenOrientationUtil.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "ScreenOrientationUtil.h"
@implementation ScreenOrientationUtil
+ (UIDevice*)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation{
    return [UIDevice currentDevice] ;
    //return deviceName.orientation;
    /*switch (deviceName.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕朝上平躺");
            return
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左横置");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            break;
            
        default:
            NSLog(@"无法辨识");
            break;
    }*/
}
@end
