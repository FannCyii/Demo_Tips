//
//  KIVSearchView.m
//  Keyboard_A
//
//  Created by kivan on 11/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "KIVSearchView.h"
#import "KIVResultCell.h"

@interface KIVSearchView ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KIVSearchView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"hintTest:%@,%f,%f",event,point.x,point.y);
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"pointInside:%@,%f,%f",event,point.x,point.y);
    return [super pointInside:point withEvent:event];
}

@end
