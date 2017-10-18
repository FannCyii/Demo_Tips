//
//  TestView.m
//  OBJC
//
//  Created by chengqifan on 26/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "TestView.h"

@interface TestView ()

@property (nonatomic, strong)NSString *ccc;
@property (nonatomic, strong)UILabel *ddd;
@property (nonatomic, assign)NSInteger inta;
@end

@implementation TestView


- (instancetype)init
{
    if(self = [super init]){
        self.ccc = @"ahahha";
        self.ddd = [[UILabel alloc]init];
        self.inta = 1200;
    }
    return self;
}
@end
