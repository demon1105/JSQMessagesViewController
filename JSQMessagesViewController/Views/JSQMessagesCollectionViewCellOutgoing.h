//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesCollectionViewCell.h"
#import "JSQMessage+MessageProtocol.h"
@class JSQMessage;
/**
 *  A `JSQMessagesCollectionViewCellOutgoing` object is a concrete instance 
 *  of `JSQMessagesCollectionViewCell` that represents an outgoing message data item.
 */
//{@"state",kMessageIndicator}
extern  NSString * const kNotificationUpdateState;

@protocol JSQMessagesCollectionViewCellOutgoingDelegate <NSObject>
-(void)resendMessage:(JSQMessage*)message;
@end

@interface JSQMessagesCollectionViewCellOutgoing : JSQMessagesCollectionViewCell
-(void)refreshIndicatorView;
@property (nonatomic,assign) kIndicatorState indicatorState;
@property (nonatomic,weak) JSQMessage * jsqMessage;
@property (nonatomic,weak) id<JSQMessagesCollectionViewCellOutgoingDelegate> resendDelegate;
@end
