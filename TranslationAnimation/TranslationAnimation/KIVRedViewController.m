//
//  KIVRedViewController.m
//  TranslationAnimation
//
//  Created by chengqifan on 17/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "KIVRedViewController.h"

@interface KIVRedViewController ()

@end

@implementation KIVRedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton *pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [pushButton setTitle:@"点击pop VC" forState:UIControlStateNormal];
    pushButton.backgroundColor = [UIColor greenColor];
    [pushButton addTarget:self action:@selector(clickPushButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"view will appear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickPushButton:(id)sender
{
    if(self.navigationController){
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"ddddddd");
        }];
    }

}

@end
