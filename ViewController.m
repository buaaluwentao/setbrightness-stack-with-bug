//
//  ViewController.m
//  mobilephonebank
//
//  Created by luwentao on 2018/8/14.
//  Copyright © 2018年 cmb. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property (weak,nonatomic) UILabel *locationInfo ;
@property (weak,nonatomic) UIButton * makeLocation;
@property (nonatomic) CLLocationManager *locationmanager;//定位服务
@property (nonatomic) NSString *currentCity;//当前城市
@property (nonatomic) NSString *strlatitude;//经度
@property (nonatomic) NSString *strlongitude;//纬度

- (void)getGeo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *locationInfo = [[UILabel alloc] init];
    NSAttributedString * locationTitle = [[NSAttributedString alloc] initWithString:@"位置信息"];
    [locationInfo setAttributedText:locationTitle];
    locationInfo.textAlignment = NSTextAlignmentCenter;
    self.locationInfo = locationInfo;
    UIButton * makeLocation = [[UIButton alloc] init];
    NSAttributedString * makeLocationTitle = [[NSAttributedString alloc] initWithString:@"获取位置"];
    [makeLocation setAttributedTitle: makeLocationTitle forState:UIControlStateNormal];
    [makeLocation addTarget:self action:@selector(getGeo) forControlEvents:UIControlEventTouchUpInside];
    self.makeLocation = makeLocation;
    [self.view addSubview:self.locationInfo];
    [self.view addSubview:self.makeLocation];
    [self.locationInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.makeLocation setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void) viewWillAppear:(BOOL)animated{
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height ;
    CGFloat navigationHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat blankHeight = [[UIScreen mainScreen] bounds].size.height - (statusHeight + navigationHeight);
    CGFloat blankWidth = [[UIScreen mainScreen] bounds].size.width;
    NSLayoutConstraint *locationInfoWidth = [NSLayoutConstraint constraintWithItem:self.locationInfo
                                                                         attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:100];
    NSLayoutConstraint *locationInfoHeight = [NSLayoutConstraint constraintWithItem:self.locationInfo
                                                                         attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:30];
    NSLayoutConstraint *locationInfoTop = [NSLayoutConstraint constraintWithItem:self.locationInfo
                                           
                                                                          attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:(blankHeight - 30)/ 2];
    NSLayoutConstraint *locationInfoLeft = [NSLayoutConstraint constraintWithItem:self.locationInfo
                                                                       attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:(blankWidth - 100)/ 2];
    [self.locationInfo addConstraint:locationInfoWidth];
    [self.locationInfo addConstraint:locationInfoHeight];
    
    [self.view  addConstraint:locationInfoTop];
    [self.view  addConstraint:locationInfoLeft];
    
    NSLayoutConstraint *makeLocationWidth = [NSLayoutConstraint constraintWithItem:self.makeLocation
                                                                         attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:100];
    NSLayoutConstraint *makeLocationHeight = [NSLayoutConstraint constraintWithItem:self.makeLocation
                                                                          attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:30];
    NSLayoutConstraint *makeLocationTop = [NSLayoutConstraint constraintWithItem:self.makeLocation
                                                                       attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.locationInfo attribute:NSLayoutAttributeTop multiplier:1 constant: 30 + 20];
    NSLayoutConstraint *locationLeft = [NSLayoutConstraint constraintWithItem:self.makeLocation
                                                                        attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:(blankWidth - 100)/ 2];
    
    [self.makeLocation addConstraint:makeLocationWidth];
    [self.makeLocation addConstraint:makeLocationHeight];
    [self.view  addConstraint:makeLocationTop];
    [self.view  addConstraint:locationLeft];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.locationmanager stopUpdatingHeading];
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    //反地理编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSString * infoDetail = nil;
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            self.currentCity = placeMark.locality;
            if (!self.currentCity) {
                self.currentCity = @"";
                infoDetail = [NSString stringWithFormat:@"%lf-%lf-%@",0.f , 0.f,@"未知位置"];
                
            }else{
                infoDetail =  [NSString stringWithFormat:@"%@",self.currentCity];
                
            }
            NSAttributedString * locationTitle = [[NSAttributedString alloc] initWithString:infoDetail];
            self.locationInfo.attributedText = locationTitle;
            
        }
    }];
   
}
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    //设置提示提醒用户打开定位服务
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"允许定位提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)getGeo{
    
    if ([CLLocationManager locationServicesEnabled]) {
        CLLocationManager * locationManager = [[CLLocationManager alloc]init];
        self.locationmanager = locationManager;
        self.locationmanager.delegate = self;
        [self.locationmanager requestAlwaysAuthorization];
        [self.locationmanager requestWhenInUseAuthorization];
        //设置寻址精度
        self.locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationmanager.distanceFilter = 5.0;
        [self.locationmanager startUpdatingLocation];
        
    }
}


@end
