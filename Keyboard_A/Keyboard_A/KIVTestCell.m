//
//  KIVTestCell.m
//  Keyboard_A
//
//  Created by kivan on 12/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "KIVTestCell.h"
#import "KIVSearchView.h"
#import "PureLayout.h"

@interface KIVTestCell ()
//@property (nonatomic, strong)KIVSearchView *searchView;
@property (nonatomic, strong)KIVSearchView *resultView;
@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic) CGFloat resultViewHeight;
@property (nonatomic) BOOL hasResultView;
@end

@implementation KIVTestCell{
    NSLayoutConstraint *_resultViewHeightConstraint;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.resultView = [[[UINib nibWithNibName:@"KIVSearchView" bundle:nil]instantiateWithOwner:self options:nil] firstObject];
        //[self.contentView addSubview:self.resultView];
        
        self.searchField = [[UITextField alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.searchField];
        [self.searchField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
        [self.searchField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
        [self.searchField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        [self.searchField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:50];
        
        self.searchField.backgroundColor = [UIColor redColor];
        
        self.resultViewHeight = 200;
        
    }
    return self;
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
    [self.contentView addSubview:self.resultView];
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


@end
