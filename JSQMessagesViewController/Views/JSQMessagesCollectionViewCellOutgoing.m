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

#import "JSQMessagesCollectionViewCellOutgoing.h"
//#import "JSQMessage+MessageProtocol.h"
NSString * const kNotificationUpdateState       = @"kNotificationUpdateState";

@interface JSQMessagesCollectionViewCellOutgoing()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UIButton *buttonResend;
@end
@implementation JSQMessagesCollectionViewCellOutgoing

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;
    [self.buttonResend addTarget:self
                          action:@selector(resendMessage:)
                forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateState:)
                                                 name:kNotificationUpdateState
                                               object:nil];
}

-(void)resendMessage:(UIButton*)sender
{
    if (self.resendDelegate) {
        sender.hidden = YES;
        if (!self.mediaView) {
            [self.indicatorView startAnimating];
        }else{
            [self.mediaView setNeedsLayout];
        }
        [self.resendDelegate resendMessage:self.jsqMessage];
    }
}

-(void)updateState:(NSNotification*)noti
{
    id<MessageProtocol>  message = noti.userInfo[@"message"];
    if (message.messageId==self.jsqMessage.messageId) {
        self.jsqMessage.messageState = message.messageState;
        [self refreshIndicatorView];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self refreshIndicatorView];
}

-(void)refreshIndicatorView
{
    self.buttonResend.hidden = YES;
    [self.indicatorView stopAnimating];
    if (self.jsqMessage.messageState==kMessageHoldingFail||
        self.jsqMessage.messageState==kMessageFailed) {
        self.buttonResend.hidden = NO;
    }else if(self.jsqMessage.messageState==kMessageSending&&!self.jsqMessage.isMediaMessage){
        [self.indicatorView startAnimating];
    }
}

@end
