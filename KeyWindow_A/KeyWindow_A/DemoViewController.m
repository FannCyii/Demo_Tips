
//
//  DemoViewController.m
//  KeyWindow_A
//
//  Created by kivan on 24/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "DemoViewController.h"
#import "UIView+HierarchyExtension.h"
@interface DemoViewController () <UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textfield;

@property (nonatomic, strong)UIButton *btn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)UITapGestureRecognizer *tapGesture;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToBack:)];
    self.tapGesture.delegate = self;
    [self.view addGestureRecognizer:self.tapGesture];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view recursionView:self.view hierarchy:0];
}

- (void)configButton:(CGRect )rect
{
    self.btn = [[UIButton  alloc]initWithFrame:rect];
    self.btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btn];
}

- (void)tapToBack:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"tap view");
    [self.view endEditing:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didselect:%ld",(long)indexPath.row);
}

//含有tap手势的view 其子视图tableView无法点击时使用如下代理方法处理
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}

@end
