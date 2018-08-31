//
//  AppDelegate.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageChannelViewController.h"
#import "ReferenceChannelViewController.h"
#import "FinancingChannelViewController.h"
#import "LifeChannelViewController.h"
#import "MyChannelViewController.h"
#import "ViewController.h"
#import "UIRootNavigationController.h"
#import "Lightness.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Lightness sharedInstance].initScreenLightness = [UIScreen mainScreen].brightness;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    
    
    
    HomePageChannelViewController * homePageRootController = [[HomePageChannelViewController alloc] init];
    ReferenceChannelViewController * referenceRootController = [[ReferenceChannelViewController alloc] init];
    FinancingChannelViewController * financingRootController = [[FinancingChannelViewController alloc] init];
    LifeChannelViewController * lifeRootController = [[LifeChannelViewController alloc] init];
    MyChannelViewController * myRootController = [[MyChannelViewController alloc] init];
    
    UIRootNavigationController * homePageChannel = [[UIRootNavigationController alloc] initWithRootViewController:homePageRootController];
    //homePageChannel.title = @"首页";
    homePageChannel.tabBarItem.title = @"首页";
    homePageChannel.tabBarItem.image = [UIImage imageNamed:@"uni_home_normal"];
    homePageChannel.tabBarItem.selectedImage = [UIImage imageNamed:@"uni_home_selected"];
    
    UIRootNavigationController * referenceChannel = [[UIRootNavigationController alloc] initWithRootViewController:referenceRootController];
    referenceChannel.tabBarItem.title = @"参考";
    referenceChannel.tabBarItem.image = [UIImage imageNamed:@"uni_referrence_normal"];
    referenceChannel.tabBarItem.selectedImage = [UIImage imageNamed:@"uni_referrence_selected"];
    
    
    UIRootNavigationController * financingChannel = [[UIRootNavigationController alloc] initWithRootViewController:financingRootController];
    financingChannel.tabBarItem.title = @"理财";
    financingChannel.tabBarItem.image = [UIImage imageNamed:@"uni_fortune_normal"];
    financingChannel.tabBarItem.selectedImage = [UIImage imageNamed:@"uni_fortune_selected"];
    
    UIRootNavigationController * lifeChannel = [[UIRootNavigationController alloc] initWithRootViewController:lifeRootController];
    lifeChannel.tabBarItem.title = @"生活";
    lifeChannel.tabBarItem.image = [UIImage imageNamed:@"uni_life_normal"];
    lifeChannel.tabBarItem.selectedImage = [UIImage imageNamed:@"uni_life_selected"];
    
    
    UIRootNavigationController * myChannel = [[UIRootNavigationController alloc] initWithRootViewController:myRootController];
    myChannel.tabBarItem.title = @"我的";
    myChannel.tabBarItem.image = [UIImage imageNamed:@"uni_mine_normal"];
    myChannel.tabBarItem.selectedImage = [UIImage imageNamed:@"uni_mine_selected"];
   
    UITabBarController * channelTabBar = [[UITabBarController alloc] init];
    self.window.rootViewController = channelTabBar;
    channelTabBar.viewControllers = @[homePageChannel, referenceChannel,lifeChannel,financingChannel,myChannel];
    
    //UITabBarItem * tabBarItem = [UITabBarItem alloc] init；
    //self.window.rootViewController.viewControllers = @[homePageChannel, referenceChannel,financingChannel,financingChannel,myChannel];
    //self.window.rootViewController.vi*/
    
    /*self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    
    ViewController * content = [[ViewController alloc] init];
    self.window.rootViewController = content;*/
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [[UIScreen mainScreen] setBrightness: [Lightness sharedInstance].initScreenLightness];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    StackForNSObject * lightnessInfoStack = [Lightness sharedInstance].lightnessInfo ;
    LightnessInfo *lightnessInfo = [lightnessInfoStack topElemet];
    if(lightnessInfo){
        [UIScreen mainScreen].brightness = lightnessInfo.currentLightness;
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
