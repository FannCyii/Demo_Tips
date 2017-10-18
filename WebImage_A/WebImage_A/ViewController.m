//
//  ViewController.m
//  WebImage_A
//
//  Created by kivan on 05/06/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+WebCache.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:imageView];
//    
//    UIImageView *tempIV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    NSString *strURL = @"http://statics.xiumi.us/stc/images/templates-assets/tpl-paper/image/2016-5-29-5.png";
//    [tempIV sd_setImageWithURL:[NSURL URLWithString:strURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        if (!error) {
//            imageView.image = image;
//        }
//    }];
//    
//    NSString *demeStr = nil;
//    NSArray *array = @[@"1",@"2"];
//    demeStr = (id)array;
//    NSLog(@"%@:%@",[demeStr class],demeStr);
    
    self.imageView.image = [UIImage imageNamed:@"image2.jpeg"];
    //self.imageView.contentMode = UIViewContentModeScaleToFill;
    [UIView animateWithDuration:10 animations:^{
        self.imageView.frame = CGRectMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        NSLog(@"%@",self.imageView);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
