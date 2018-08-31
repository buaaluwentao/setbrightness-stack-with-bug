//
//  ShowInfoViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/22.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "ShowInfoViewController.h"

@interface ShowInfoViewController ()
- (void) showInfo:(NSNotification * ) notification;
@end

@implementation ShowInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showInfo:) name:@"LocationInfo" object:nil];
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
- (void) showInfo:(NSNotification * ) notification{
    NSLog(@"%@" , [[notification userInfo] objectForKey:@"info"]);
}
@end
