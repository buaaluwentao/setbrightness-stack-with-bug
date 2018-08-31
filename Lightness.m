//
//  Lightness.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/28.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "Lightness.h"
#import "LightnessInfo.h"
@implementation Lightness

+(instancetype ) sharedInstance{
    
    static Lightness * instance = nil;
    
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Lightness alloc] init];
        instance.lightnessInfo = [[StackForNSObject alloc] init];
    });
    return instance;
}
@end
