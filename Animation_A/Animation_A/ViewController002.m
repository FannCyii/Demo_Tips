//
//  ViewController002.m
//  Animation_A
//
//  Created by chengqifan on 31/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ViewController002.h"
#import "UIView+CreateLayoutView.h"

#import "PureLayout.h"

@interface ViewController002 ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, readwrite, strong)UITableView * tableView1;
@property (nonatomic, readwrite, strong)UITableView * tableView2;
@property (nonatomic, readwrite, strong)UITableView * tableView3;

@property (nonatomic, readwrite, strong)UIView * lineView;

@property (nonatomic, readwrite, strong)UICollectionView * collectionView;
@property (nonatomic, readwrite, strong)UIScrollView * scrollView;

@end

@implementation ViewController002

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.lineView = [UIView autoLayoutInit];
    self.lineView.backgroundColor = [UIColor redColor];
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    //flowLayout.itemSize = CGSizeMake(100, 100);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor yellowColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    self.collectionView.pagingEnabled = YES;
    
    self.scrollView = [UIScrollView autoLayoutInit];
    self.scrollView.backgroundColor = [UIColor cyanColor];
    self.scrollView.contentOffset = CGPointMake(0,0);//
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height);
    self.scrollView.delegate = self;
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.scrollView];
    
    self.collectionView.hidden = NO;
    self.scrollView.hidden = YES;
    
    [self contraintsConfig];
}

- (void)contraintsConfig
{
    [self.lineView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:90];
    [self.lineView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.lineView autoSetDimension:ALDimensionWidth toSize:45];
    [self.lineView autoSetDimension:ALDimensionHeight toSize:3];
    
    [self.collectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView withOffset:3];
    //[self.collectionView autoSetDimension:ALDimensionHeight toSize:100];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.scrollView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView withOffset:3];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"ssssssss");
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [super splitViewController];
    float scrollF = scrollView.contentOffset.x;
    NSLog(@"%f",scrollF);
    self.lineView.frame = CGRectMake(scrollF/4, self.lineView.frame.origin.y, self.lineView.frame.size.width, self.lineView.frame.size.height);
    [self.lineView layoutIfNeeded];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if(indexPath.row%2 == 0){
        cell.backgroundColor = [UIColor grayColor];
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.bounds.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
