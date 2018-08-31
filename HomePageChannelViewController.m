//
//  HomePageViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "HomePageChannelViewController.h"
#import "ScreenOrientationUtil.h"
#import <WebKit/WebKit.h>

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "DetailsViewController.h"
#import <sys/utsname.h>
#define DLog(fmt, ...)  NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
@interface HomePageChannelViewController ()<WKNavigationDelegate>
- (void)screenOrientationChanged:(UIInterfaceOrientation)interfaceOrientation;
//@property (nonatomic ,weak) UILabel * introduction ;
- (struct CGRect )reviseFrame:(CGFloat)screenWidth srceenHeight:(CGFloat)srceenHeight width:(CGFloat)width height:(CGFloat)height;
@property (nonatomic) WKWebView * wk;
@property CGFloat statusHeight;
@property CGFloat navBarHeight;
- (NSString *)telPhoneType;
- (void) jump;
@property UILabel * currentLightness;
@end

@implementation HomePageChannelViewController
- (void)viewDidLoad {
    //NSLog(@"HomePageChannelViewController viewDidLoad");
    [super viewDidLoad];
    //NSLog(@"HomePageChannelViewController viewDidLoad");
    // Do any additional setup after loading the view.
    /*CGFloat width = 100,height = 30;
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat screenWidth = screen.bounds.size.width;
    CGFloat screenHeight = screen.bounds.size.height;
    UILabel * introduction = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth - width ) / 2 , (screenHeight - height ) / 2, width, height)] ;
    
    introduction.text = @"这个是主页";
    self.introduction = introduction;
    [self.view addSubview:self.introduction];*/
    /*
    self.statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    self.navBarHeight = 0.0;
    if(self.navigationController.navigationBar){
        self.navBarHeight = self.navigationController.navigationBar.frame.size.height;
    }
    
    CGFloat aligmentHeight = self.statusHeight + self.navBarHeight;
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, aligmentHeight, screenWidth, screenHeight - aligmentHeight)];
    self.wk = wkWebView;
    [self.view addSubview:wkWebView];
    self.wk.navigationDelegate = self;
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    [self.wk loadRequest:urlRequest];*/
    //UIDevice *device = [UIDevice currentDevice];
    
    /* 系统名 */
    //NSString *systemName = [device systemName];
    
    /* 系统版本号 */
    //NSString *phoneVersion = [device systemVersion];
    
    /* 设备品牌 */
    //NSString *brand = [device model];
    /*
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    //当前手机所属运营商名称
    NSString *mobileCarrier;
    //先判断有没有SIM卡，如果没有则不获取本机运营商
    
   
    
    
    if (!carrier.isoCountryCode) {
        mobileCarrier = @"无运营商";
    }else{
        mobileCarrier = [carrier carrierName];
    }
    NSLog(@"%@,%@",self.telPhoneType,mobileCarrier);

    NSDictionary *nd =@{@"a":@"1",@"b":@"2"};
    DLog(@"%@",nd);*/
   
    CGFloat width = 150,height = 30;
    UIScreen *screen = [UIScreen mainScreen];
    
    
    UILabel * currentLightness = [[UILabel alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2 + height + 20, width, height) ];
    currentLightness.text = [NSString stringWithFormat:@"当前亮度:%f",[UIScreen mainScreen].brightness];
    self.currentLightness = currentLightness;
    UIButton * jump = [[UIButton alloc] initWithFrame:CGRectMake((screen.bounds.size.width - width ) / 2 , (screen.bounds.size.height - height ) / 2 + height + 20  + height + 20, width, height) ];
    NSAttributedString * buttonStyle = [[NSAttributedString alloc] initWithString:@"跳转" attributes:nil];
    [jump setAttributedTitle:buttonStyle forState:UIControlStateNormal];
    [jump addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:currentLightness];
    [self.view addSubview:jump];
}
- (void) viewWillDisappear:(BOOL)animated{
    //NSLog(@"HomePageChannelViewController viewWillDisappear");
    [super viewWillDisappear:animated];
    //NSLog(@"HomePageChannelViewController viewWillDisappear");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    //NSLog(@"view did appear");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenOrientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil
     ];
    
}
- (void) viewWillAppear:(BOOL)animated{
    //NSLog(@"什么鬼？");
    [super viewWillAppear:animated];
    //self.currentLightness.text = [NSString stringWithFormat:@"亮度为：%f",[UIScreen mainScreen].brightness];
}
- (void) jump{
    DetailsViewController * details = [[DetailsViewController alloc] init];
    [self.navigationController pushViewController:details animated:YES];
}
- (void)screenOrientationChanged:(UIInterfaceOrientation)interfaceOrientation{
    UIDevice * deviceName = [ScreenOrientationUtil handleDeviceOrientationDidChange:interfaceOrientation];
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat screenWidth = screen.bounds.size.width;
    CGFloat screenHeight = screen.bounds.size.height;
    CGFloat aligmentHeight = self.statusHeight + self.navBarHeight;
    CGRect frame = CGRectMake(0, aligmentHeight, screenWidth, screenHeight - aligmentHeight);
    //CGFloat temp = 0;
    //使用接收广播的方式获取屏幕位置 ， 屏幕适配
   
    switch (deviceName.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕朝上平躺");
            self.wk.frame = frame;
            NSLog(@"%@" ,self.wk);
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            self.wk.frame = frame;
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            
            NSLog(@"屏幕向左横置");
     
            NSLog(@"%@" ,self.wk);
            self.wk.frame = frame;
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
     
           
            
            self.wk.frame = frame;
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
           
            self.wk.frame = frame;
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            self.wk.frame = frame;
            break;
            
        default:
            NSLog(@"无法辨识");
            break;
    }
}
- ( CGRect )reviseFrame:(CGFloat)screenWidth srceenHeight:(CGFloat)srceenHeight width:(CGFloat)width height:(CGFloat)height{
     CGRect frame = CGRectMake((screenWidth - width ) / 2 , (srceenHeight - height ) / 2, width, height);
    
    /*void * tempAddress = (void*)malloc(sizeof(struct CGRect));
    memcpy(tempAddress,&frame,sizeof(struct CGRect) );*/
    return frame;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil
     ];
}
#pragma mark -- 加载前
- (void) webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载");
}
#pragma  mark -- 数据已经返回
- (void) webView:(WKWebView*)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"数据返回");
}
#pragma mark -- 数据加载完毕
- (void) webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"加载完成了");
}
#pragma mark -- 数据加载出错
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"数据加载出错，%@" , error.description);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSString*) telPhoneType{
    return @"";
}
@end
