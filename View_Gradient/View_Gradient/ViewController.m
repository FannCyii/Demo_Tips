//
//  ViewController.m
//  View_Gradient
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, readwrite, strong) UIView * testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_testView];
   // [self colorGradualChange:self.testView];
    self.view.backgroundColor = [UIColor clearColor];
    self.testView.backgroundColor = [UIColor clearColor];
    [self gradientTest:_testView starHex:0xe53b00 endHex:0xfe5a1a];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)colorGradualChange:(UIView *)aView {
    
    CAGradientLayer *gradualLayer = [CAGradientLayer layer];
    
    gradualLayer.frame = aView.bounds;
    gradualLayer.opacity = 0.4;
    [aView.layer addSublayer:gradualLayer];
    
    //渐变颜色
    gradualLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor];
    //渐变段
    gradualLayer.locations = @[@0,@(1)];
    
    //渐变方向
    gradualLayer.startPoint = CGPointMake(0, 0);
    gradualLayer.endPoint   = CGPointMake(0, 1);
    
}

- (void)gradientTest:(UIView *)aView starHex:(NSInteger)startHex endHex:(NSInteger)endHex
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = aView.bounds;
    [aView.layer addSublayer:gradientLayer];
    //set gradient colors
    gradientLayer.colors = @[(__bridge id)[self hexToUIColor:startHex].CGColor, (__bridge id) [self hexToUIColor:endHex].CGColor];
    
    //set locations
    gradientLayer.locations = @[@0, @1];
    
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
}

- (UIColor *)hexToUIColor:(NSInteger)rgbValue
{
    //    CGFloat red   = (hexValue & 0xff >> 16)/255.0;
    //    CGFloat green = (hexValue & 0xff >> 8 ) /255.0;
    //    CGFloat blue  = (hexValue & 0xff)/255.0;
    //    CGFloat alpha = (hexValue & 0xff >> 24)/255.0;
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}



@end
