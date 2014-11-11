//
//  JSQMessage+MessageProtocol.m
//  MyIdol
//
//  Created by Nicholas Tau on 11/11/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "JSQMessage+MessageProtocol.h"
#import <objc/runtime.h>

@implementation JSQMessage (MessageProtocol)

-(void)setMessageId:(NSUInteger)messageId
{
    objc_setAssociatedObject(self, @selector(messageId), @(messageId), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSUInteger)messageId
{
    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
}

-(void)setMessageState:(kMessageState)messageState
{
    objc_setAssociatedObject(self, @selector(messageState), @(messageState), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(kMessageState)messageState
{
    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
}

@end
