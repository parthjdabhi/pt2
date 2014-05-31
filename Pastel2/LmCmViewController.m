//
//  ViewController.m
//  Lumina
//
//  Created by SSC on 2014/05/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "LmCmViewController.h"

@interface LmCmViewController ()

@end

@implementation LmCmViewController

- (void)initCameraManager
{
    _isCameraInitializing = YES;
    if (_cameraManager) {
        [_cameraManager deallocCamera];
        _cameraManager = nil;
    }
    
    self.cameraManager = [[LmCmCameraManager alloc] init];
    self.cameraManager.delegate = self;
    [self.cameraManager setPreview:self.cameraPreview];
    self.isCameraInitializing = NO;
    return;
    
    __block __weak LmCmViewController* _self = self;
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        @autoreleasepool {
            _self.cameraManager = [[LmCmCameraManager alloc] init];
            _self.cameraManager.delegate = _self;
        }
        dispatch_async(q_main, ^{
            [_self.cameraManager setPreview:_self.cameraPreview];
            _self.isCameraInitializing = NO;
            LOG(@"Camera is ready");
        });
        
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initVolumeHandling];
    if (![UIDevice isCurrentLanguageJapanese]) {
        [LmCmSharedCamera instance].soundEnabled = YES;
    }
    [MotionOrientation initialize];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(orientationDidChange) name:@"MotionOrientationChangedNotification" object:nil];
    
    
    _zoomViewManager = [[LmCmViewManagerZoom alloc] init];
    _zoomViewManager.view = self.view;
    _zoomViewManager.delegate = self;
    _previewManager = [[LmCmViewManagerPreview alloc] init];
    _previewManager.view = self.view;
    _previewManager.delegate = self;
    _toolsManager = [[LmCmViewManagerTools alloc] init];
    _toolsManager.delegate = self;
    _toolsManager.view = self.view;
    
    //// Preview
    CGRect previewFrame;
    if ([UIDevice underIPhone5]) {
        previewFrame = self.view.bounds;
    }else{
        previewFrame = CGRectMake(0.0f, [LmCmSharedCamera topBarHeight], [UIScreen width], [UIScreen height] - [LmCmSharedCamera topBarHeight] - [LmCmSharedCamera bottomBarHeight]);
    }
    _cameraPreview = [[UIView alloc] initWithFrame:previewFrame];
    [self.view addSubview:_cameraPreview];
    
    //// camera
    [self initCameraManager];
    
    //// Black rect
    _blackRectView = [[LmCmViewCropBlackRect alloc] initWithFrame:_cameraPreview.frame];
    [_blackRectView setRectWithCropSize:[LmCmSharedCamera instance].cropSize];
    [self.view addSubview:_blackRectView];
    
    //// Overlay
    _cameraPreviewOverlay = [[LmCmViewPreviewOverlay alloc] initWithFrame:_cameraPreview.frame];
    [self.view addSubview:_cameraPreviewOverlay];
        
    //// Bar
    _topBar = [[LmCmViewTopBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen width], [LmCmSharedCamera topBarHeight])];
    [self.view addSubview:_topBar];
    _bottomBar = [[LmCmViewBottomBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen width], [LmCmSharedCamera bottomBarHeight])];
    [_bottomBar setY:[UIScreen height] - [_bottomBar height]];
    [self.view addSubview:_bottomBar];
    if ([UIDevice underIPhone5]) {
        _topBar.transparent = YES;
        _bottomBar.transparent = YES;
    }
    
    //// Shutter
    _shutterButton = [[LmCmButtonShutter alloc] initWithFrame:[LmCmSharedCamera shutterButtonRect]];
    _shutterButton.soundEnabled = [LmCmSharedCamera instance].soundEnabled;
    [_shutterButton addTarget:self action:@selector(didShutterButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_shutterButton addTarget:self action:@selector(didShutterButtonTouchCancel:) forControlEvents:UIControlEventTouchUpOutside];
    [_bottomBar addShutterButton:_shutterButton];
    
    //// View did load
    [_zoomViewManager viewDidLoad];
    [_previewManager viewDidLoad];
    [_toolsManager viewDidLoad];
    
    [self loadLastPhoto];

}

- (void)viewDidAppear:(BOOL)animated
{
    if (_cameraManager.isRunning == NO) {
        [_cameraManager enableCamera];
    }
}

#pragma mark shutter

- (void)shootingDidCancel
{
    _shutterButton.shooting = NO;
}

- (void)didShutterButtonTouchUpInside:(id)sender
{
    if (_isCameraInitializing) {
        return;
    }
    _shutterButton.holding = NO;
    _shutterButton.shooting = YES;
    if ([LmCmSharedCamera instance].soundEnabled) {
        [self flashScreen];
    }
    [_cameraManager takeOnePicture];
}

- (void)didShutterButtonTouchCancel:(id)sender
{
    _shutterButton.holding = NO;
}

#pragma mark delegate

#pragma makr camera delegate
- (void)singleImageNoSoundDidTakeWithAsset:(LmCmImageAsset *)lmAsset
{
    [self performSelectorOnMainThread:@selector(flashScreen) withObject:nil waitUntilDone:NO];
    if (lmAsset.image) {
        lmAsset = [LmCmSharedCamera applyZoomToAsset:lmAsset];
        lmAsset = [LmCmSharedCamera fixRotationWithNoSoundImageAsset:lmAsset];
        lmAsset = [LmCmSharedCamera cropAsset:lmAsset];
    }
    [self singleImageDidTakeWithAsset:lmAsset];
}

- (void)singleImageByNormalCameraDidTakeWithAsset:(LmCmImageAsset *)lmAsset
{
    if (lmAsset.image) {
        lmAsset = [LmCmSharedCamera applyZoomToAsset:lmAsset];
        lmAsset = [LmCmSharedCamera cropAsset:lmAsset];
    }
    [self singleImageDidTakeWithAsset:lmAsset];
}

- (void)singleImageDidTakeWithAsset:(LmCmImageAsset *)asset
{
    __block LmCmViewController* _self = self;
    
    [self.assetLibrary writeImageToSavedPhotosAlbum:asset.image.CGImage orientation:ALAssetOrientationUp completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
            LOG(@"%@", error);
            switch (error.code) {
                case -3311:
                    [self showAlertViewWithTitle:NSLocalizedString(@"Error", nil) Message:NSLocalizedString(@"no_access_to_your_photos", nil)];
                    break;
                default:
                    [self showAlertViewWithTitle:NSLocalizedString(@"Error", nil) Message:NSLocalizedString(@"Couldn't save your photo", nil)];
                    break;
            };
            return;
        }
        [_self.assetLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset) {
            _self.cameraManager.processingToConvert = NO;
            [_self lastAssetDidLoad:asset];
            _self.shutterButton.shooting = NO;
            [_self imageDidSave:asset];
        } failureBlock:^(NSError *error) {
            
        }];
    }];
}

- (void)imageDidSave:(ALAsset *)alAsset
{
    self.lastAsset = alAsset;
}

- (void)flashScreen
{
    [self.cameraPreviewOverlay flash];
}

#pragma mark present

- (void)presentEditorViewController
{
    if (self.lastAsset == nil) {
        return;
    }
    [self disableCamera];
    PtViewControllerEditor* con = [[PtViewControllerEditor alloc] init];
    ALAssetRepresentation *representation = [self.lastAsset defaultRepresentation];
    @autoreleasepool {
        
        UIImage *img = [UIImage imageWithCGImage:[representation fullResolutionImage]
                                           scale:[representation scale]
                                     orientation:[representation orientation]];
        if (img == nil) {
            return;
        }
        if ([PtSharedApp instance].useFullResolutionImage == NO) {
            float length = MAX(img.size.width, img.size.height);
            if (length > 1920.0f) {
                float scale = img.size.width / 1920.0f;
                if (img.size.height > img.size.width) {
                    scale = img.size.height / 1920.0f;
                }
                img = [img resizedImage:CGSizeMake(img.size.width / scale, img.size.height / scale) interpolationQuality:kCGInterpolationHigh];
            }
        }
        con.imageToProcess = img;
    }
    [self.navigationController pushViewController:con animated:YES];
}


#pragma mark camera roll


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([[[viewController class] description] isEqualToString:@"PUUIAlbumListViewController"]) {
        self.toolsManager.camerarollButton.selected = NO;
    }
    if ([[[viewController class] description] isEqualToString:@"PLUIAlbumListViewController"]) {
        self.toolsManager.camerarollButton.selected = NO;
    }
}

- (void)openCameraRoll
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.delegate = self;
    [pickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage* imageOriginal = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if(imageOriginal){
        if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
            UIImageWriteToSavedPhotosAlbum(imageOriginal, nil, nil, nil);
        }
        //// Do your stuff
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)orientationDidChange
{
    UIDeviceOrientation o = [MotionOrientation sharedInstance].deviceOrientation;
    
    __block LmCmViewController* _self = self;
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        [_self.blackRectView setRectWithCropSize:[LmCmSharedCamera instance].cropSize];
        [_self.cameraPreviewOverlay setNeedsDisplay];
        [_self.toolsManager orientationDidChangeTo:o];
    });
    
    
}

#pragma mark photo

- (void)loadLastPhoto
{
    __block LmCmViewController* _self = self;
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        _self.assetLibrary = [[ALAssetsLibrary alloc] init];
    });
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        @autoreleasepool
        {
            [_self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup* group, BOOL* stop){
                [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                int numberOfAssets = (int)[group numberOfAssets];
                LOG(@"Assets: %d", numberOfAssets);
                if (numberOfAssets > 0) {
                    [group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:numberOfAssets - 1] options:0 usingBlock:^(ALAsset* asset, NSUInteger index, BOOL* stop) {
                        if ([[asset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                            [self performSelectorOnMainThread:@selector(lastAssetDidLoad:) withObject:asset waitUntilDone:nil];
                        }
                    }];
                }
            } failureBlock:^(NSError* error){
                
            }];
        }
    });
}

- (void)lastAssetDidLoad:(ALAsset *)asset
{
    self.lastAsset = asset;
    [self.toolsManager lastPhotoButtonSetAsset:asset];
}

#pragma mark volume

- (void)initVolumeHandling
{
    [self setVolumeNotification];
    
    //MPVolumeViewをオフスクリーンに。
    CGRect frame = CGRectMake(-100, -100, 100, 100);
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:frame];
    [volumeView sizeToFit];
    [self.view addSubview:volumeView];
    
    AudioSessionInitialize(NULL, NULL, NULL, NULL);
    UInt32 category = kAudioSessionCategory_AmbientSound;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(category), &category);
    AudioSessionSetActive(true);
    
    initialVolume = [MPMusicPlayerController applicationMusicPlayer].volume;
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [center addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    
}

- (void)setVolumeNotification {
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(volumeChanged:)
     name:@"AVSystemController_SystemVolumeDidChangeNotification"
     object:nil];
}

- (void)volumeChanged:(NSNotification *)notification{
    //明示的にボリューム変更がされた時のみ
    if ([[[notification userInfo]objectForKey:@"AVSystemController_AudioVolumeChangeReasonNotificationParameter"]isEqualToString:@"ExplicitVolumeChange"]) {
        
        //ここで撮影をおこなうメソッド等を呼ぶ
        if ([LmCmSharedCamera instance].volumeSnapEnabled) {
            [self didShutterButtonTouchUpInside:_shutterButton];
        }
        
        //一旦NSNotificationCenterからAVSystemController_SystemVolumeDidChangeNotificationを外して、ボリュームを元に戻す
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
        [MPMusicPlayerController applicationMusicPlayer].volume = initialVolume;
        [self performSelector:@selector(setVolumeNotification) withObject:nil afterDelay:0.2];
    }
}

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    AudioSessionSetActive(false);
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    initialVolume = [MPMusicPlayerController applicationMusicPlayer].volume;
    [self setVolumeNotification];
    AudioSessionSetActive(true);
}

- (void)enableCamera
{
    [self.cameraManager enableCamera];
}

- (void)disableCamera
{
    [self.cameraManager disableCamera];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    if ([UIDevice isiPad]) {
        return UIInterfaceOrientationMaskLandscapeLeft;
    }
    return UIInterfaceOrientationMaskPortrait;
}

@end
