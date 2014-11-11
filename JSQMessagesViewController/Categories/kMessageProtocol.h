//
//  kMessageProtocol.h
//  MyIdol
//
//  Created by Nicholas Tau on 11/10/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#ifndef MyIdol_kMessageProtocol_h
#define MyIdol_kMessageProtocol_h

typedef enum : NSUInteger {
    kMessageSending = 0,   //消息发送中
    kMessageReSending,     //消息重新发送中
    kMessageHolding,       //媒体类型的消息，附件上传成功了（发送中）
    kMessageHoldingFail,   //媒体类型的消息，附件上传成功后，发送失败
    kMessageFailed,        //消息发送失败
    kMessageSuccess
} kMessageState;

@protocol MessageProtocol <NSObject>
@property (nonatomic,assign) kMessageState messageState;
@property (nonatomic,assign) NSUInteger messageId;
@end

#endif
