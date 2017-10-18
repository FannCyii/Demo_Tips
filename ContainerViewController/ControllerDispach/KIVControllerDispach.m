//
//  KIVControllerDispach.m
//  ContainerViewController
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "KIVControllerDispach.h"

@interface KIVControllerDispach ()

@property (nonatomic, readwrite, strong) UIViewController *rootVC;
@property (nonatomic, readwrite, strong) NSMutableArray<UIViewController *> *controllers;

@end

@implementation KIVControllerDispach

- (instancetype)init
{
    self = [super init];
    if(self){
        _rootVC = [self currentWindow].rootViewController;//[[UINavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]];
        //_rootVC.navigationBarHidden = YES;
        _controllers = [NSMutableArray array];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)shareController
{
    static KIVControllerDispach * controller;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[KIVControllerDispach alloc]init];
    });
    return controller;
}

- (void)pushVC:(UIViewController *)vc
{
    [self.controllers addObject:vc];
    
//    if(vc.parentViewController == nil){
//        [self currentWindow].rootViewController = self.rootVC;
//        [self.rootVC pushViewController:vc animated:NO];
//    }else if([vc.parentViewController isKindOfClass:[UINavigationController class]]){
//        UINavigationController * nv = (UINavigationController *)vc.parentViewController;
//        [nv pushViewController:vc animated:NO];
//    }else{
//        [vc.parentViewController presentViewController:vc animated:NO completion:nil];
//    }
}

- (UIViewController *)popVC
{
    if(self.controllersCount == 0){
        return nil;
    }
    UIViewController * popVc = [self.controllers objectAtIndex:self.controllersCount - 1];
    [self.controllers removeObject:popVc];
    return popVc;
}

- (NSInteger)controllersCount
{
    return self.controllers.count;
}

- (UIWindow *)currentWindow
{
    return [UIApplication sharedApplication].keyWindow;
}


@end
