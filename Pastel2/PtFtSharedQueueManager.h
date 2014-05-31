//
//  PtFtSharedQueueManager.h
//  Pastel2
//
//  Created by SSC on 2014/05/31.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PtFtProcessQueue.h"

@protocol PtFtSharedQueueManagerDelegate
- (void)queueDidFinished:(PtFtProcessQueue*)queue;
- (void)dispatchPreviewprogress:(float)progress;
@end

@interface PtFtSharedQueueManager : NSObject
{
    NSMutableArray* _queueList;
}

@property (nonatomic, weak) id<PtFtSharedQueueManagerDelegate> delegate;
@property (nonatomic, assign) BOOL processing;
@property (nonatomic, assign) BOOL canceled;
@property (nonatomic, weak) UIImage* originalImage;
@property (nonatomic, weak) UIImage* previewImage;
@property (nonatomic, weak) UIImage* presetImage;

+ (PtFtSharedQueueManager*)instance;

- (PtFtProcessQueue*)shiftQueue;
- (void)addQueue:(VnObjectProcessingQueue*)queue;

- (void)processQueue;
- (void)processQueueTypePreset:(VnObjectProcessingQueue*)queue;
- (void)processQueueTypePreview:(VnObjectProcessingQueue*)queue;
- (void)processQueueTypeOriginal:(VnObjectProcessingQueue*)queue;

- (void)commonInit;
- (void)cancelAllQueue;

@end
