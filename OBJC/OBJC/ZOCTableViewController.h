//
//  ZOCTableViewController.h
//  OBJC
//
//  Created by chengqifan on 12/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZOCFeedParserProtocol;
@interface ZOCTableViewController : UITableViewController
- (instancetype)initWithFeedParser:(id<ZOCFeedParserProtocol>)feedParser;
@end
