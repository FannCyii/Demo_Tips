//
//  TestViewController.m
//  CollecitionView_A
//
//  Created by chengqifan on 02/05/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "TestViewController.h"
#import "MyFlowLayout.h"

#import "TestSupplementaryView.h"
#import "TestReusableFooterView.h"

@interface TestViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource >
@property (nonatomic, readwrite, strong)UICollectionView * collView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyFlowLayout * flowLayout = [[MyFlowLayout alloc]init];
    self.collView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:self.collView];
    //self.collView.backgroundColor = [UIColor whiteColor];
    self.collView.delegate = self;
    self.collView.dataSource = self;
    
    [self.collView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    /*
     注意cell和附加视图都是在collectionView上注册，而装饰视图是在layout上注册
     */
    //这里是注册 header 和 footer
    [self.collView registerClass:[TestSupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header_TestSupplementaryView"];
    [self.collView registerClass:[TestReusableFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer_TestSupplementaryView"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor purpleColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//这里是设置返回的Header和Footer的，根据Kind来区别（系统已指定kind类型）
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header_TestSupplementaryView" forIndexPath:indexPath];
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer_TestSupplementaryView" forIndexPath:indexPath];
    }
    return reusableView;
}

//下列两个方法用于返回header和footer的尺寸大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 100);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 50);
}

@end
