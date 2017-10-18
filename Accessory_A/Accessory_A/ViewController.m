//
//  ViewController.m
//  Accessory_A
//
//  Created by kivan on 17/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import "AccessoryCell.h"
#import "TZImagePickerController.h"

NSInteger const maxAccessoryCount = 5;
CGFloat const imageViewWith = 100;

@interface ViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate,UINavigationControllerDelegate,TZImagePickerControllerDelegate,AccessoryCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong)NSMutableArray *accessoryimages;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accessoryViewHeightConstraint;

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.accessoryimages = [NSMutableArray array];
    
    //[self.collectionView registerClass:[AccessoryCell class] forCellWithReuseIdentifier:@"AccessoryCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AccessoryCell" bundle:nil] forCellWithReuseIdentifier:@"AccessoryCell"];
    self.accessoryViewHeightConstraint.constant = imageViewWith * (1 +self.accessoryimages.count/3);    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.accessoryimages.count < maxAccessoryCount) {
        return self.accessoryimages.count + 1;
    }
    return self.accessoryimages.count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AccessoryCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AccessoryCell" forIndexPath:indexPath];
    UIImage *cellImage = nil;
    if (self.accessoryimages.count > 0 && self.accessoryimages.count > indexPath.item) {
        cellImage = self.accessoryimages[indexPath.item];
    }
    [cell updateDataWith:cellImage];
    cell.delegate = self;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"picker");
    if (indexPath.row<self.accessoryimages.count) {
        return;
    }
    
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"拍照");
        [self addAccessoryImageUseCamera];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"从相册中选择");
        [self addAccessoryImageInAlbum];
    }];
    
    [alerController addAction:action2];
    [alerController addAction:action3];
    [alerController addAction:action1];
    
    [self presentViewController:alerController animated:YES completion:^{
        NSLog(@"show alerController");
    }];
}

//#pragma mark - UICollectionViewDelegateFlowLayout
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(imageViewWith,imageViewWith);
//}

- (void)addAccessoryImageInAlbum
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:maxAccessoryCount - self.accessoryimages.count delegate:self];

    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
{
    //NSLog(@"%@",photos);
    
    if (photos.count + self.accessoryimages.count <= maxAccessoryCount) {
        [self.accessoryimages addObjectsFromArray:photos];
    }
    
     self.accessoryViewHeightConstraint.constant = imageViewWith * (1 +self.accessoryimages.count/3);
    [self.collectionView reloadData];
}

- (void)addAccessoryImageUseCamera
{
    UIImagePickerController *pickVC  = [[UIImagePickerController alloc]init];
    pickVC.delegate = self;
    pickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:pickVC animated:YES completion:^{
        NSLog(@"拍照");
    }];
}

- (void)didSelectDeleteWithAccessoryCell:(AccessoryCell *)cell
{
    NSLog(@"删除");
    NSIndexPath *deletePath = [self.collectionView indexPathForCell:cell];
    
    [self.accessoryimages removeObjectAtIndex:deletePath.row];
    [self.collectionView reloadData];
}


@end
