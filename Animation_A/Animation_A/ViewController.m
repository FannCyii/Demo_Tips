//
//  ViewController.m
//  View_Layout
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ViewController.h"
#import "ViewController001.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, readwrite, strong) UILabel * atitle;

@property (nonatomic, readwrite, strong)UITableView * menuTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuTable = [[UITableView alloc]initWithFrame:self.view.frame];
    self.menuTable.delegate = self;
    self.menuTable.dataSource = self;
    [self.view addSubview:self.menuTable];
    self.menuTable.backgroundColor = [UIColor grayColor];
    
    [self.menuTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Animation%ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld",indexPath.row);
    if(indexPath.row == 0){
        [self.navigationController  pushViewController:[[ViewController001 alloc]init] animated:YES];
    }
}
@end
