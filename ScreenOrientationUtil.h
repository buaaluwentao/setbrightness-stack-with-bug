//
//  ScreenOrientationUtil.h
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "UIApplication.h"
@interface ScreenOrientationUtil : NSObject
+ (UIDevice*)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation;
@end
