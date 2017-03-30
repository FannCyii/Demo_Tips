//
//  ViewController.m
//  View_Layout
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ViewController.h"
#import "BannerView.h"

@interface ViewController ()
@property (nonatomic, readwrite, strong) BannerView * bannerView;
@property (nonatomic, readwrite, strong) UILabel * atitle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    self.bannerView = [BannerView autoLayoutInit];
    [self.view addSubview:self.bannerView];
    [self constraintsConfig];
    //self.bannerView.alpha = 0.5;
    
    //[self printFrame:self.view];
    [self printFrame:self.bannerView];
    
    self.atitle = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
    [self.view addSubview:self.atitle];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 40, 50, 50)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)buttonClicked
{
    [UIView transitionWithView:self.atitle duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.atitle setText:@"hahahhahahaha"];
    } completion:nil];
}

- (void)constraintsConfig
{
    [self.bannerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:44];
    [self.bannerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.bannerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.bannerView autoSetDimension:ALDimensionHeight toSize:90];

}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
    //[self printFrame:self.view];
    [self printFrame:self.bannerView];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
    //[self printFrame:self.view];
    [self printFrame:self.bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillLayoutSubviews{
    NSLog(@"viewWillLayoutSubviews");
    //[self printFrame:self.view];
    [self printFrame:self.bannerView];
}

-(void)viewDidLayoutSubviews{
    NSLog(@"viewDidLayoutSubviews");
    //[self printFrame:self.view];
    [self printFrame:self.bannerView];
    [self.bannerView gradientColorWithStarHex:0xe53b00 endHex:0xffffff];
   
}

- (void)printFrame:(UIView *)aView
{
    NSLog(@"==================");
    NSLog(@"%@:%f|%f|%f|%f",[aView class],aView.frame.origin.x,aView.frame.origin.y ,aView.frame.size.width,aView.frame.size.height);
    NSLog(@"==================");
}

@end
