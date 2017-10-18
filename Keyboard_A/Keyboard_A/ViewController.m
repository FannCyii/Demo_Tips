//
//  ViewController.m
//  Keyboard_A
//
//  Created by chengqifan on 08/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import <IQKeyboardManager.h>
#import <PYSearch.h>
#import <PureLayout.h>
#import "KIVSearchView.h"
#import "KIVTestCell.h"
#import "KIVScrollViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *serachbutton;
//@property (nonatomic, strong)PYSearchViewController *searchViewController;
@property (weak, nonatomic) IBOutlet UIView *searchBackView;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong)KIVSearchView *resultView;
@property (nonatomic)BOOL hasResultView;
@property (nonatomic)CGFloat resultViewHeight;

@property (weak, nonatomic) IBOutlet UITextView *viewText;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewTextheight;

@end

@implementation ViewController{
    NSLayoutConstraint *_resultViewHeightConstraint;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    btn.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    [self mySearch];
    self.resultViewHeight = 300;
    
    [self.tableview registerClass:[KIVTestCell class] forCellReuseIdentifier:@"KIVTestCell"];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGSize tSize = [self.viewText sizeThatFits:self.viewText.frame.size];
    self.viewTextheight.constant = tSize.height;
}

- (void)buttonAction
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pySearch
{

    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"搜索城市" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
            NSLog(@"哈哈哈：%@",searchText);
    }];
    searchViewController.searchSuggestionHidden = YES;
    searchViewController.searchHistoryTitle = @"搜索历史";
    searchViewController.emptySearchHistoryLabel.text = @"清空历史";
    // 3. present the searchViewController
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
}

- (IBAction)testactionSearch:(UIButton *)sender
{
    [self pySearch];
}


- (void)mySearch
{
    [self.searchField addTarget:self action:@selector(changeSearchContext:) forControlEvents:UIControlEventEditingChanged];
     [self.searchField addTarget:self action:@selector(beginChangeSearchContext:) forControlEvents:UIControlEventEditingDidBegin];
     [self.searchField addTarget:self action:@selector(endChangeSearchContext:) forControlEvents:UIControlEventEditingDidEnd];

}

- (KIVSearchView *)resultView
{
    if (!_resultView) {
        
        _resultView = [[[NSBundle mainBundle] loadNibNamed:@"KIVSearchView" owner:self options:nil] objectAtIndex:0];
        //_resultView.backgroundColor = [UIColor redColor];
    }
    return _resultView;
}

- (void)addResultViewInSuperView
{
    [self.view addSubview:self.resultView];
    self.hasResultView = YES;
    [self.resultView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchField];
    [self.resultView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.resultView autoPinEdgeToSuperviewEdge:ALEdgeRight];

    _resultViewHeightConstraint = [self.resultView autoSetDimension:ALDimensionHeight toSize:self.resultViewHeight];
    [self.resultView layoutIfNeeded];
}

- (void)dismissResultView
{
    [self.resultView removeFromSuperview];
    self.hasResultView = NO;
}

- (void)changeResultViewHeight:(CGFloat)height{
    _resultViewHeightConstraint.constant = height;
    [self.resultView layoutIfNeeded];
}


- (void)changeSearchContext:(UITextField *)textField
{
    NSLog(@"chenged=====%@",textField.text);
    
    [self changeResultViewHeight:_resultViewHeightConstraint.constant+5];
    [self.resultView layoutIfNeeded];
}


- (void)beginChangeSearchContext:(UITextField *)textField
{
    NSLog(@"begin=====%@",textField.text);
    if (!self.hasResultView) {
        [self addResultViewInSuperView];
    }
}

- (void)endChangeSearchContext:(UITextField *)textField
{
    NSLog(@"end=====%@",textField.text);
    [self dismissResultView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KIVTestCell"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"aaaaa click cell");
//    
//   UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 200)];
//    [view addSubview:self.resultView];
//    [self.view  addSubview:self.resultView];
//    //[self addResultViewInSuperView];
//    
//    self.tableview.userInteractionEnabled = NO;
//    [self.tableview resignFirstResponder];
//    [self.resultView becomeFirstResponder];
    

}


@end
