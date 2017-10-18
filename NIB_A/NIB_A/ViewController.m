//
//  ViewController.m
//  NIB_A
//
//  Created by kivan on 19/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import "Test01View.h"
#import "PureLayout.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Test01View *view01 = [[[UINib nibWithNibName:@"Test01View" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    [self.view addSubview:view01];
    
    
    [view01 autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [view01 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [view01 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [view01 autoSetDimension:ALDimensionHeight toSize:100];
    
    [self.myTV autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.myTV autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.myTV autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
    [self.myTV autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:view01];
    
    UIButton *btn = [[UIButton alloc]init];
    [view01 addSubview:btn];
    btn.frame = CGRectMake(10, 10, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickButton:(UIButton *)btn
{
    NSLog(@"aaaaaa");
    UIWindow *windwo = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootvc = [[UIViewController alloc]init];
    rootvc.view.backgroundColor = [UIColor greenColor];
    
    
    //[UIApplication sharedApplication].keyWindow
    
    windwo.rootViewController = rootvc;

    [windwo makeKeyAndVisible];
    windwo.windowLevel = 0;
}

@end
