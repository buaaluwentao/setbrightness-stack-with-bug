//
//  Lightness.h
//  mobilephonebank
//
//  Created by luwentao on 2018/8/28.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StackForNSObject.h"



@interface Lightness : NSObject
@property StackForNSObject *lightnessInfo;
@property CGFloat initScreenLightness;
+(instancetype ) sharedInstance;

@end
