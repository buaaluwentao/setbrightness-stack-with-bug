//
//  ContentViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/28.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "ContentViewController.h"
#import "Lightness.h"
#import "LightnessInfo.h"
@interface ContentViewController ()<UITextFieldDelegate>
@property CGFloat screenLightness;
@property (weak,nonatomic) UITextField * setLightness;
@property (weak,nonatomic) UILabel * currentLightness;
@end

@implementation ContentViewController

- (void)viewDidLoad {
    NSLog(@"ContentViewController,viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ContentViewController,viewDidLoad");
    CGFloat width = 150,height = 30;
    UIScreen *screen = [UIScreen mainScreen];
    
    
    UILabel * currentLightness = [[UILabel alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2 , width, height) ];
    currentLightness.text = @"当前亮度";
    self.currentLightness = currentLightness;
    UITextField * setLightness = [[UITextField alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2  + height + 20, width, height) ];
    setLightness.text = @"0";
    setLightness.delegate = self;
    self.setLightness = setLightness;
    UIButton * jump = [[UIButton alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2 + height + 20  + height + 20 , width, height) ];
    NSAttributedString * buttonStyle = [[NSAttributedString alloc] initWithString:@"设置亮度" attributes:nil];
    
    [jump setAttributedTitle:buttonStyle forState:UIControlStateNormal];
    [jump addTarget:self action:@selector(setScreenLightness) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:currentLightness];
    [self.view addSubview:jump];
    [self.view addSubview:setLightness];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setScreenLightness{
    NSLog(@"setScreenLightness");
    CGFloat lightness = [self.setLightness.text floatValue];
    self.screenLightness = lightness;
    StackForNSObject * lightnessInfoStack = [Lightness sharedInstance].lightnessInfo ;
    LightnessInfo *lightnessInfo = [lightnessInfoStack topElemet];
    //if(lightnessInfo.viewController == self){ //已经压入栈
    lightnessInfo.currentLightness = lightness;
    [UIScreen mainScreen].brightness = lightness;
    //}
    //NSLog(@"栈--%ld" ,[lightnessInfoStack stackLength]);
    self.currentLightness.text = [NSString stringWithFormat:@"%f", lightness ];
    [UIScreen mainScreen].brightness = lightness;
    //修改当前亮度时
    
    //NSLog(@"%@" ,self.currentLightness.text);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) viewWillDisappear:(BOOL)animated{
    NSLog(@"ContentViewController,viewWillDisappear");
    [super viewWillDisappear:animated];
    NSLog(@"ContentViewController,viewWillDisappear");
}
- (void) viewDidDisappear:(BOOL)animated{
   //NSLog(@"content viewDidDisappear");
    
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //NSLog(@"detail,当前亮度=%f",[UIScreen mainScreen].brightness );
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

@end
