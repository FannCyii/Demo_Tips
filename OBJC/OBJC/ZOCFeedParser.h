//
//  ZOCFeedParser.h
//  OBJC
//
//  Created by chengqifan on 12/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZOCFeedParserDelegate.h"

@interface ZOCFeedParser : NSObject <ZOCFeedParserProtocol>  //遵循ZOCFeedParserProtocol接口

@property (nonatomic, weak) id <ZOCFeedParserDelegate> delegate;
@property (nonatomic, strong) NSURL *url;

- (id)initWithURL:(NSURL *)url;

- (BOOL)start;
- (void)stop;

@end
