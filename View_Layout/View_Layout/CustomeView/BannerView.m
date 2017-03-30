//
//  BannerView.m
//  View_Layout
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "BannerView.h"

@interface BannerView() <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong, readwrite)UICollectionView * headerCollectionView;

@end

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if(self){
        [self subConfig];
        [self gradientColorWithStarHex:0x000001 endHex:0xffeead];
        [self constraintsConfig];
    }
    return self;
}

- (void)subConfig
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.headerCollectionView  = [[UICollectionView  alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.headerCollectionView.delegate = self;
    self.headerCollectionView.dataSource = self;
    self.headerCollectionView.backgroundColor = [UIColor clearColor];
    [self.headerCollectionView  registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionView"];
    [self addSubview:self.headerCollectionView];
}

- (void)constraintsConfig
{
    [self.headerCollectionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.headerCollectionView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.headerCollectionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.headerCollectionView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"UICollectionView" forIndexPath:indexPath];
    return cell;
}

@end
