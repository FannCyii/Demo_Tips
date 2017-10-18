//
//  MyFlowLayout.m
//  CollecitionView_A
//
//  Created by chengqifan on 27/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "MyFlowLayout.h"
#import "TestDecorationReusableView.h"

@implementation MyFlowLayout


//准备工作
- (void)prepareLayout
{
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 1;
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height/5);
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView.backgroundColor = [UIColor clearColor];
    //UIView decorationView = [[UIView alloc]initWithFrame:self.collectionView.bounds];
    
    //切记，装饰视图必须是UICollectionReusableView的子视图
    [self registerClass:[TestDecorationReusableView class] forDecorationViewOfKind:@"TestDecorationView"];
}

//这里的尺寸不是指可视部分的尺寸，而应该是所有内容所占的尺寸
//-(CGSize)collectionViewContentSize
//{
//    return CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 100);
//}

//初始的layout的外观将由该方法返回的UICollectionViewLayoutAttributes来决定
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //一定要调用super方法，这里放回的attributs就是要展现的attributes,所以各种效果就是在这里处理，每个UICollectionViewLayoutAttributes 代表一个cell（附加视图，装饰视图）包含有其各种图形属性
    NSArray<UICollectionViewLayoutAttributes *> *attributs = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray * allAttr = attributs.mutableCopy;

    for (UICollectionViewLayoutAttributes * atr in attributs) {

        switch (atr.representedElementCategory) {
            case UICollectionElementCategoryCell:{
                    NSLog(@"UICollectionElementCategoryCell");
                //这里给每个cell添加装饰视图
                    UICollectionViewLayoutAttributes *decorationAttributs = [self layoutAttributesForDecorationViewOfKind:@"TestDecorationView" atIndexPath:atr.indexPath];
                    decorationAttributs.frame = atr.frame;
                    //decorationAttributs.zIndex = -1; //如果不指定装饰视图的z坐标，那么某些装饰视图会被cell遮住，而有些会遮住cell。所以需要设置好装饰视图的zIndex属性
                    [allAttr addObject:decorationAttributs];
                }
                break;
            case UICollectionElementCategorySupplementaryView:
                NSLog(@"UICollectionElementCategorySupplementaryView");
                break;
            case  UICollectionElementCategoryDecorationView:
                NSLog(@"UICollectionElementCategoryDecorationView");
                break;
            default:
                break;
        }
    }
    
    return allAttr;
}

- (void)printRect:(CGRect)rect
{
    NSLog(@"x=%f,y=%f,w=%f,h=%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}

//返回对应于indexPath的位置的cell的布局属性,布局刷新时会调用,如shouldInvalidateLayoutForBoundsChange返回YES时就会调用，而返回NO则不会调用
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"====%ld",indexPath.item);
    return [super layoutAttributesForItemAtIndexPath:indexPath];
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;//返回YES表示当边界改变的时候，-invalidateLayout会自动被发送，才能让layout得到刷新
}

//proposedContentOffset是没有对齐到网格时本来应该停下的位置，而该函数的返回值就是其最终要停留的位置
- (CGPoint)targetContentOffsetForProposedContentOffset: (CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //proposedContentOffset是没有对齐到网格时本来应该停下的位置
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    //对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) > ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}


-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    //attributes.size = CGSizeMake(self.collectionView.frame.size.width, 300);
    return attributes;
}

@end
