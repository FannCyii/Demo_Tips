//
//  ViewController.m
//  RAC_A
//
//  Created by chengqifan on 17/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)RACSignal *signal;
@property (nonatomic, strong)RACSignal *signal1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"正在被创建");
        [subscriber sendNext:@"aaaa"];
        [subscriber sendNext:@"aaaa2"];
        [subscriber sendNext:@"aaaa3"];
        [subscriber sendNext:@"aaaa4"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    [self.signal subscribeNext:^(NSString * str) {
        NSLog(@"第一次订阅%@",str);
    }];
    

    
    RACMulticastConnection *multicast = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"这是一个广播,正在被创建");
//        [subscriber sendNext:@"bbbb"];
//        [subscriber sendCompleted];
        
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendNext:@"bbbb"];
            [subscriber sendCompleted];
        }];
    
        
        return nil;
    }] publish];
    
    [multicast connect];
    
    self.signal1 = multicast.signal;
    
    [self.signal1 subscribeNext:^(NSString * str) {
        NSLog(@"第一次订阅 广播%@",str);
    }];
    

    
}

- (IBAction)buttonClicked:(UIButton *)sender{
    NSLog(@"按钮点击");
//    [self.signal subscribeNext:^(NSString * str) {
//        NSLog(@"第二次订阅%@",str);
//    }];
    
    [self.signal1 subscribeNext:^(NSString * str) {
        NSLog(@"第二次订阅 广播%@",str);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
