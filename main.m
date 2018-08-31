//
//  main.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <sys/utsname.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>

#import  "Student.h"
#import "HouseKeeper.h"


int main(int argc, char * argv[]) {
   
    Student * stu = [[Student alloc] init];
    
    stu.delegete = [[HouseKeeper alloc] init];
    [stu wrapperService];
    //stu 
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
