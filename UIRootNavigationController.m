//
//  UIRootNavigationController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/29.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "UIRootNavigationController.h"

@interface UIRootNavigationController ()

@end

@implementation UIRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    StackForNSObject * lightnessInfoStack = [Lightness sharedInstance].lightnessInfo ;
    //LightnessInfo *lightnessInfo = [lightnessInfoStack topElemet];
    [lightnessInfoStack popTopElement];
    NSLog(@"弹出元素，剩余：%ld",[lightnessInfoStack stackLength]);
    //NSLog(@"stack length=%ld" ,[lightnessInfoStack stackLength]);
    //[[UIScreen mainScreen] setBrightness:lightnessInfo.initLightness];
    //NSLog(@"RootViewController viewWillDisappear");
    return [super popViewControllerAnimated:animated];
}

@end
