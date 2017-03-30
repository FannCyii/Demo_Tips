//
//  ParentsViewController.m
//  ContainerViewController
//
//  Created by chengqifan on 17/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

/** 主要涉及如下5个方法
 
 - (void)addChildViewController:(UIViewController *)childController
 - (void)removeFromParentViewController
 - (void)transitionFromViewController：：：：：：
 - (void)willMoveToParentViewController:(UIViewController *)parent
 - (void)didMoveToParentViewController:(UIViewController *)parent
 
 */

#import "ParentsViewController.h"
#import "ChildViewController.h"

@interface ParentsViewController ()
@property (nonatomic, strong, readwrite)ChildViewController * childVC;
@end

@implementation ParentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton * addBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    addBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:addBtn];
    [addBtn addTarget:self  action:@selector(addChildVC) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * reduceBtn = [[UIButton alloc]initWithFrame:CGRectMake(70, 10, 50, 50)];
    reduceBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:reduceBtn];
    [reduceBtn addTarget:self  action:@selector(removeChildVC) forControlEvents:UIControlEventTouchUpInside];
    

    
    
}
- (void)addChildVC{
    _childVC = [[ChildViewController alloc]init];
    [self addChildViewController:self.childVC];//#1
    [self.view addSubview:self.childVC.view];//#2
    self.childVC.view.frame = CGRectMake(100, 100, 200, 300);
    //不添加#1,只执行#2 则执行#2的时候，childVC会立即执行viewWillAppear和viewDidAppear 等方法
    //如果添加#1并在#2之前，则会正常调用viewWillAppear和viewDidAppear 等方法，即 父类viewWillAppear后调用子类的viewWillAppear，父类的viewDidAppear调用后再调用子类的viewDidAppear，其他方法同理。在调用addChildViewController方法前系统会自动调用willMoveToParentViewController方法，
}

- (void)removeChildVC
{
    [self.childVC removeFromParentViewController];//在执行removeFromParentViewController方法前会自动调用didMoveToParentViewController方法（注意如果自定义这些方法，必须调用其对应的super方法）。调用 child 的removeFromParentViewController方法后可以查看 parent的childcontainers 发现为空，或者查看child的parentviewcontroller查看也为空；如果再调用该方法则没有任何效果。
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Parent: viewWillAppear:(BOOL)animated");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"Parent: viewDidAppear:(BOOL)animated");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Parent: viewWillDisappear:(BOOL)animated");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
