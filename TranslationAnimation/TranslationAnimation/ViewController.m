//
//  ViewController.m
//  TranslationAnimation
//
//  Created by chengqifan on 17/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "ViewController.h"
#import "KIVRedViewController.h"
#import "TestObject.h"

#import "KIVVCTransitionAnimator.h"
#import "KIVTransitionInteracter.h"
#import "KIVPCViewController.h"


@interface ViewController () <UINavigationControllerDelegate>

@property (nonatomic, readwrite, strong)UIPercentDrivenInteractiveTransition * percentDrivenInteractiveController;

@property (nonatomic, readwrite, strong) KIVVCTransitionAnimator *animator;
@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClicked:(UIButton *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [pushButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    pushButton.backgroundColor = [UIColor greenColor];
    [pushButton addTarget:self action:@selector(clickPushButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    UIButton *pushButton2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [pushButton2 setTitle:@"点击跳转" forState:UIControlStateNormal];
    pushButton2.backgroundColor = [UIColor greenColor];
    [pushButton2 addTarget:self action:@selector(clickPushButton2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton2];
    
    
    self.navigationController.hidesBarsOnTap = YES;
    self.navigationController.delegate = self;
    self.percentDrivenInteractiveController = [UIPercentDrivenInteractiveTransition new];
    
    [self transitionConfig];
}
- (void)transitionConfig
{
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panFuncion:)];
    [self.navigationController.view addGestureRecognizer:panRecognizer];
    self.animator = [KIVVCTransitionAnimator new];
    //设置动画类型
    self.animator.animationType = KIVTransitionUpWard;
}

//手势响应方法  向做滑动
- (void)panFuncion:(UIPanGestureRecognizer*)recognizer
{
    UIView* view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [recognizer locationInView:view];
        if (location.x > CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count == 1){
            self.percentDrivenInteractiveController = [UIPercentDrivenInteractiveTransition new];
            [self clickPushButton:nil];
            //[self.navigationController.visibleViewController performSegueWithIdentifier:PushSegueIdentifier sender:self];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        // fabs() 求浮点数的绝对值
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.percentDrivenInteractiveController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x < 0) {
            [self.percentDrivenInteractiveController finishInteractiveTransition];
        } else {
            [self.percentDrivenInteractiveController cancelInteractiveTransition];
        }
        self.percentDrivenInteractiveController = nil;
    }
}


- (void)clickPushButton:(id)sender
{
    [self.navigationController pushViewController:[[KIVRedViewController alloc]init] animated:YES];
}

- (void)clickPushButton2:(id)sender
{
    KIVPCViewController * vc = [[KIVPCViewController alloc]init];
    [vc presentViewControllerAnimation:YES];
    
}
////转场过程中对VC的控制
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    NSLog(@"willShowViewController:%@",viewController);
//    //viewController.view.backgroundColor = [UIColor greenColor];
//}
//
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    NSLog(@"didShowViewController:%@",viewController);
//    //viewController.view.backgroundColor = [UIColor whiteColor];
//}


//转场动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if( operation == UINavigationControllerOperationPush){
        return self.animator;
    } else if (operation == UINavigationControllerOperationPop)
    {
        //self.animator.animationType = KIVTransitionDownWard;
        return self.animator;
    }
    return nil;
}


////实现交互是转场
//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
//{
//    return self.percentDrivenInteractiveController;
//}



@end
