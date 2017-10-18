//
//  TSAVC.m
//  TransitionAnimation_B
//
//  Created by chengqifan on 04/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "TSAVC.h"
//ChildVC
#import "TSAChild01VC.h"
//Animator
#import "TSAAnimator.h"
#import "RSAAnimator2.h"
#import "GPUImage.h"

@interface TSAVC ()<UINavigationControllerDelegate>

@property (nonatomic, readwrite, strong)UIScreenEdgePanGestureRecognizer *screenEdgnPanGesture;
@property (nonatomic, readwrite, strong)UIPercentDrivenInteractiveTransition * interactiveTransition;

@end

@implementation TSAVC

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationController.delegate = self;
    [self pushButton];
    [self gestureConfig];
    [self gpuImageTest];
}
- (void)viewDidAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewDidAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewDidDisappear:animated];
}


- (void)pushButton
{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor colorWithRed:1 green:0.3 blue:0.6 alpha:0.9];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)gestureConfig
{
    self.screenEdgnPanGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgnPanGestureAction:)];
    self.screenEdgnPanGesture.edges = UIRectEdgeLeft;//UIRectEdgeLeft | UIRectEdgeRight;组合无效，为什么

    [self.navigationController.view addGestureRecognizer:self.screenEdgnPanGesture];
}

- (void)screenEdgnPanGestureAction:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer
{
    //NSLog(@"screenEdgnPanGestureAction:");
    UIView* view = self.navigationController.view;
    CGPoint point = [gestureRecognizer translationInView:view];
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan){
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self.navigationController pushViewController:[[TSAChild01VC alloc]init] animated:YES];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged){
        CGFloat program = fabs(point.x/view.bounds.size.width);
        [self.interactiveTransition updateInteractiveTransition:program];
        //[self.view setNeedsDisplay];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded){
        if([gestureRecognizer translationInView:view].x > view.bounds.size.width*4/5){
            [self.interactiveTransition finishInteractiveTransition];
        }else {
            [self.interactiveTransition cancelInteractiveTransition];
        }
        self.interactiveTransition = nil;
    }
    
}

- (void)buttonClick:(UIButton *)button
{
    NSLog(@"buttonClick");
    
    [self.navigationController pushViewController:[[TSAChild01VC alloc]init] animated:YES];
    
}

- (void)gpuImageTest
{
    UIImage *image = [UIImage imageNamed:@"test"];

    UIImageView * imgView1 = [[UIImageView alloc]initWithImage:image];
    imgView1.frame = CGRectMake(10, 200, 100, 100);
    [self.view addSubview:imgView1];
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image];
    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
    
    [stillImageSource addTarget:stillImageFilter];
    [stillImageFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    //GPUImageHazeFilter *stillHazeFilter = [[GPUImageHazeFilter alloc]init];
    
    UIImage *currentFilteredVideoFrame = [stillImageFilter imageFromCurrentFramebuffer];
    UIImageView * imgView2 = [[UIImageView alloc]initWithImage:currentFilteredVideoFrame];
    imgView2.frame = CGRectMake(10, 400, 100, 100);
    [self.view addSubview:imgView2];
    
    
    GPUImageSepiaFilter *stillImageFilter2 = [[GPUImageSepiaFilter alloc] init];
    UIImage *quickFilteredImage = [stillImageFilter2 imageByFilteringImage:image];
    UIImageView * imgView3 = [[UIImageView alloc]initWithImage:quickFilteredImage];
    imgView3.frame = CGRectMake(200, 200, 100, 100);
    [self.view addSubview:imgView3];
    
    
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return self.interactiveTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
//    TSAAnimator *animator =  nil;
//    
//    if  (operation == UINavigationControllerOperationPush){
//        animator = [[TSAAnimator alloc]init];
//        animator.animationType = KIVTransitionLeftWard;
//    }else if(operation == UINavigationControllerOperationPop){
//        animator = [[TSAAnimator alloc]init];
//        animator.animationType = KIVTransitionRightWard;
//    }
    
    RSAAnimator2 * animator = [[RSAAnimator2 alloc]init];
    
    
    return animator;
}

- (UIImage *)viewShotWithView:(UIView *)view
{
    //UIWindow *screenWindow = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContext(view.frame.size);
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* viewImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}



@end
