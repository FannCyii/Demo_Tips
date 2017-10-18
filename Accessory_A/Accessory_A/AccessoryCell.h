//
//  AccessoryCell.h
//  Accessory_A
//
//  Created by kivan on 17/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccessoryCell;
@protocol AccessoryCellDelegate <NSObject>

- (void)didSelectDeleteWithAccessoryCell:(AccessoryCell *)cell;

@end


@interface AccessoryCell : UICollectionViewCell


@property (nonatomic, weak) id < AccessoryCellDelegate > delegate;

- (void)updateDataWith:(UIImage *)newImage;
@end
