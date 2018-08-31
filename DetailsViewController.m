//
//  DetailsViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/28.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "DetailsViewController.h"
#import "ContentViewController.h"
#import "StackForNSObject.h"
#import "Lightness.h"
#import "LightnessInfo.h"
@interface DetailsViewController ()<UITextFieldDelegate>
- (void) jump;
@property UILabel * currentLightness;
@property UITextField * showLightness;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    //NSLog(@"DetailsViewController viewDidLoad");
    [super viewDidLoad];
    NSLog(@"DetailsViewController viewDidLoad");
    // Do any additional setup after loading the view.
    CGFloat width = 150,height = 30;
    UIScreen *screen = [UIScreen mainScreen];
    
    
    UILabel * currentLightness = [[UILabel alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2 , width, height) ];
    currentLightness.text = [NSString stringWithFormat:@"当前亮度%f" ,[UIScreen mainScreen].brightness];
    self.currentLightness = currentLightness;
    UITextField * showLightness = [[UITextField alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2  + height + 20, width, height) ];
    showLightness.text = @"0";
    showLightness.delegate = self;
    self.showLightness = showLightness;
    UIButton * setupLightness = [[UIButton alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2 + height + 20  + height + 20, width, height) ];
    NSAttributedString * buttonStyle1 = [[NSAttributedString alloc] initWithString:@"设置亮度" attributes:nil];
    [setupLightness setAttributedTitle:buttonStyle1 forState:UIControlStateNormal];
    [setupLightness addTarget:self action:@selector(setScreenLightness) forControlEvents:UIControlEventTouchUpInside];
    UIButton * jump = [[UIButton alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 + 5 +  width, (screen.bounds.size.height - height ) / 2 + height + 20  + height + 20, width, height) ];
    NSAttributedString * buttonStyle2 = [[NSAttributedString alloc] initWithString:@"跳转" attributes:nil];
    [jump setAttributedTitle:buttonStyle2 forState:UIControlStateNormal];
    [jump addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:currentLightness];
    [self.view addSubview:jump];
    [self.view addSubview:showLightness];
    [self.view addSubview:setupLightness];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setScreenLightness{
    NSLog(@"setScreenLightness");
    CGFloat lightness = [self.showLightness.text floatValue];
    StackForNSObject * lightnessInfoStack = [Lightness sharedInstance].lightnessInfo ;
    LightnessInfo *lightnessInfo = [lightnessInfoStack topElemet];
    lightnessInfo.currentLightness = lightness;
    [UIScreen mainScreen].brightness = lightness;
    self.currentLightness.text = [NSString stringWithFormat:@"%f", lightness ];
    [UIScreen mainScreen].brightness = lightness;
  
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.currentLightness.text = [NSString stringWithFormat:@"亮度为：%f",[UIScreen mainScreen].brightness];
}
- (void) viewWillDisappear:(BOOL)animated{
    //NSLog(@"DetailsViewController viewWillDisappear");
    [super viewWillDisappear:animated];
    //NSLog(@"DetailsViewController viewWillDisappear");
    
}
- (void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //NSLog(@"view disappeared");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"关闭键盘");
    if ([string isEqualToString:@"\n"]) {
        //在这里写你当你点击回车键时执行的事件
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
    
}
- (void) jump{
    ContentViewController * content = [[ContentViewController alloc] init];
    [self.navigationController pushViewController:content animated:YES];
}
@end
