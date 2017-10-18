//
//  AccessoryCell.m
//  Accessory_A
//
//  Created by kivan on 17/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "AccessoryCell.h"

@interface AccessoryCell ()
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIImageView *accessoryImageView;
@end

@implementation AccessoryCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)updateDataWith:(UIImage *)newImage
{
    self.accessoryImageView.image = newImage;
    if (newImage) {
        self.deleteButton.hidden = NO;
    } else {
        self.deleteButton.hidden = YES;
    }
}

- (IBAction)clickDeleteButton:(UIButton *)deleteButton
{
    NSLog(@"aaaaaa:deletebutton");
    if ([self.delegate respondsToSelector:@selector(didSelectDeleteWithAccessoryCell:)]) {
        [self.delegate didSelectDeleteWithAccessoryCell:self];
    }
}

@end
