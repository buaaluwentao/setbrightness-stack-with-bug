//
//  LifeViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "LifeChannelViewController.h"

@interface LifeChannelViewController ()

@end

@implementation LifeChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 100,height = 30;
    UIScreen *screen = [UIScreen mainScreen];
    
    UILabel * introduction = [[UILabel alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2, width, height)] ;
    introduction.text = @"这个是生活页";
    [self.view addSubview:introduction];
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

@end
