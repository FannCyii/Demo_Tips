//
//  ZOCFeedParserDelegate.h
//  OBJC
//
//  Created by chengqifan on 12/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZOCFeedParserDelegate;
@protocol ZOCFeedParserProtocol <NSObject>   //遵循改该接口的 类都需要实现该接口声明的属性和方法

@property (nonatomic, weak) id <ZOCFeedParserDelegate> delegate;
@property (nonatomic, strong) NSURL *url;

- (BOOL)start;
- (void)stop;

@end


@class ZOCFeedInfoDTO;
@class ZOCFeedParser;
@class ZOCFeedItemDTO;
@protocol ZOCFeedParserDelegate <NSObject>

@optional
- (void)feedParserDidStart:(ZOCFeedParser *)parser;
- (void)feedParser:(ZOCFeedParser *)parser didParseFeedInfo:(ZOCFeedInfoDTO *)info;
- (void)feedParser:(ZOCFeedParser *)parser didParseFeedItem:(ZOCFeedItemDTO *)item;
- (void)feedParserDidFinish:(ZOCFeedParser *)parser;
- (void)feedParser:(ZOCFeedParser *)parser didFailWithError:(NSError *)error;

@end
