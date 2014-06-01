//
//  PtViewControllerFilters.m
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtViewControllerFilters.h"

@interface PtViewControllerFilters ()

@end

@implementation PtViewControllerFilters

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [PtEdConfig bgColor];
    
    //// Managers
    _filtersManager = [[PtFtViewManagerFilters alloc] init];
    _filtersManager.delegate = self;
    _filtersManager.view = self.view;
    _slidersManager = [[PtFtViewManagerSliders alloc] init];
    _slidersManager.delegate = self;
    _slidersManager.view = self.view;
    _navigationManager = [[PtFtViewManagerNavigation alloc] init];
    _navigationManager.delegate = self;
    _navigationManager.view = self.view;
    
    //// Preview
    float restHeight = self.view.height - [PtFtConfig colorBarHeight] - [PtFtConfig overlayBarHeight] - [PtFtConfig artisticBarHeight] - [PtSharedApp bottomNavigationBarHeight];
    float w, h;
    UIImage* image = [PtSharedApp instance].imageToProcess;
    if (image.size.width > image.size.height) {
        w = self.view.width;
        h = image.size.height * w / image.size.width;
    }else{
        h = restHeight - 40.0f;
        w = image.size.width * h / image.size.height;
    }
    _previewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, w, h)];
    _previewImageView.center = CGPointMake(self.view.width / 2.0f, restHeight / 2.0f + 20.0f);
    _previewImageView.image = image;
    [self.view addSubview:_previewImageView];
    
    [_filtersManager viewDidLoad];
    [_slidersManager viewDidLoad];
    [_navigationManager viewDidLoad];
    
    
    __block __weak PtViewControllerFilters* _self = self;
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        @autoreleasepool {
            UIImage* image = [PtSharedApp instance].imageToProcess;
            //// for preset image
            CGSize presetImageSizeWithAspect = [PtFtConfig presetBaseImageSize];
            if (image.size.width > image.size.height) {
                presetImageSizeWithAspect.width = image.size.width * presetImageSizeWithAspect.height / image.size.height;
            } else {
                presetImageSizeWithAspect.height = image.size.height * presetImageSizeWithAspect.width / image.size.width;
            }
            image = [image resizedImage:presetImageSizeWithAspect interpolationQuality:kCGInterpolationHigh];
            float x = 0.0f;
            float y = 0.0f;
            CGSize presetImageSize = [PtFtConfig presetBaseImageSize];
            if (image.size.width > image.size.height) {
                x = (image.size.width - presetImageSize.width) / 2.0f;
            } else {
                y = (image.size.height - presetImageSize.height) / 2.0f;
            }
            image = [image croppedImage:CGRectMake(x, y, presetImageSize.width, presetImageSize.height)];
            _self.presetOriginalImage = image;
        }
        dispatch_async(q_main, ^{
            [_self initPresetQueuePool];
            [[PtFtSharedQueueManager instance] addQueue:[_self shiftQueueFromPool]];
        });
    });
}

#pragma mark queue
#pragma mark pool

- (void)initPresetQueuePool
{
    _presetQueuePool = [NSMutableArray array];
    NSMutableArray* filters = [PtFtSharedFilterManager instance].artisticFilters;
    for (int i = 0; i < filters.count; i++) {
        PtFtObjectFilterItem* item = (PtFtObjectFilterItem*)[filters objectAtIndex:i];
        PtFtObjectProcessQueue* queue = [[PtFtObjectProcessQueue alloc] init];
        if (item) {
            queue.type = PtFtProcessQueueTypePreset;
            queue.effectId = item.effectId;
            queue.image = self.presetOriginalImage;
            [_presetQueuePool addObject:queue];
        }
    }
}

- (PtFtObjectProcessQueue *)shiftQueueFromPool
{
    if (_presetQueuePool.count == 0) {
        return nil;
    }
    PtFtObjectProcessQueue* queue = [_presetQueuePool objectAtIndex:0];
    [_presetQueuePool removeObjectAtIndex:0];
    return queue;
}

#pragma mark delegate

- (void)queueDidFinished:(PtFtObjectProcessQueue *)queue
{
    LOG(@"Queue did finished.");
    switch (queue.type) {
        case PtFtProcessQueueTypePreview:
        {

        }
            break;
        case PtFtProcessQueueTypePreset:
        {
            [_filtersManager setPresetImage:queue.image ToEffect:queue.effectId];
        }
            break;
        case PtFtProcessQueueTypeOriginal:
        {
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
