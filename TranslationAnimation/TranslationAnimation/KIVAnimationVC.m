//
//  KIVAnimationVC.m
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "KIVAnimationVC.h"
#import "KIVRedViewController.h"
@interface KIVAnimationVC ()

@end

@implementation KIVAnimationVC
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [pushButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    pushButton.backgroundColor = [UIColor greenColor];
    [pushButton addTarget:self action:@selector(clickPushButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
}


- (void)clickPushButton:(id)sender
{
    [self presentViewController:[[KIVRedViewController alloc]init] animated:YES completion:^{
        NSLog(@"xxxxxxx");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
