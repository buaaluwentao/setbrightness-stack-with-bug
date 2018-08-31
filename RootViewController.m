//
//  RootViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/28.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "RootViewController.h"
#import "StackForNSObject.h"
#import "LightnessInfo.h"
#import "Lightness.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"RootViewController viewDidLoad");
    // Do any additional setup after loading the view.
    
    LightnessInfo *lightnessInfo = [[LightnessInfo alloc] init];
    lightnessInfo.viewController = self;
    lightnessInfo.initLightness = [[UIScreen mainScreen] brightness];
    lightnessInfo.currentLightness = lightnessInfo.initLightness;
    StackForNSObject * lightnessInfoStack = [Lightness sharedInstance].lightnessInfo ;
   
    [lightnessInfoStack push:lightnessInfo];
    NSLog(@"压入元素，元素个数为：%ld" ,[lightnessInfoStack stackLength]);
}
- (void) viewWillAppear:(BOOL)animated{
    
    StackForNSObject * lightnessInfoStack = [Lightness sharedInstance].lightnessInfo ;
    LightnessInfo *lightnessInfo = [lightnessInfoStack topElemet];
    if(lightnessInfo.viewController == self && lightnessInfo.currentLightness != lightnessInfo.currentLightness){
        NSLog(@"更新亮度：%f",lightnessInfo.currentLightness);
        [[UIScreen mainScreen] setBrightness: lightnessInfo.currentLightness];
    }else{
        NSLog(@"未更新亮度：%f",lightnessInfo.initLightness);
    }
    
    //[[UIScreen mainScreen] setBrightness:lightnessInfo.initLightness];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
