//
//  KIVPCViewController.m
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "KIVPCViewController.h"
#import "UIView+KIVViewGeometry.h"

@interface KIVPCViewController ()

@end

@implementation KIVPCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [pushButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    pushButton.backgroundColor = [UIColor greenColor];
    [pushButton addTarget:self action:@selector(clickPushButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickPushButton:(id)sender
{
    //[self removeFromParentViewController];
    if(self.navigationController){
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"ddddddd");
        }];
    }
}

- (void)presentViewControllerAnimation:(BOOL)animated
{
    UIWindow * currentWindow = [UIApplication sharedApplication].keyWindow;
    
    if ([currentWindow.rootViewController isKindOfClass:[UINavigationController class]]){
        UINavigationController * nc = (UINavigationController *)currentWindow.rootViewController;
        [nc pushViewController:self animated:NO];
    }else if([currentWindow.rootViewController isKindOfClass:[UIViewController class]]){
        [currentWindow.rootViewController presentViewController:self animated:NO completion:nil];
    }
    
    
    self.view.center = CGPointMake(self.view.centerX, self.view.centerY + self.view.sizeHeight);
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.frame = [UIView mainScreenBounds];
    }];
    
}




@end
