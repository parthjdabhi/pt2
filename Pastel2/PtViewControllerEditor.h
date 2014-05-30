//
//  PtViewControllerEditor.h
//  Pastel2
//
//  Created by SSC on 2014/05/27.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "PtViewTopBar.h"
#import "PtViewBottomBar.h"
#import "PtViewBarButton.h"

@interface PtViewControllerEditor : UIViewController

@property (nonatomic, strong) UIImage* imageToProcess;
@property (nonatomic, strong) PtViewBottomBar* bottomBar;
@property (nonatomic, strong) PtViewTopBar* topBar;

@property (nonatomic, strong) PtViewBarButton* camerarollButton;
@property (nonatomic, strong) PtViewBarButton* instagramButton;
@property (nonatomic, strong) PtViewBarButton* twitterButton;
@property (nonatomic, strong) PtViewBarButton* facebookButton;
@property (nonatomic, strong) PtViewBarButton* otherButton;
@property (nonatomic, strong) PtViewBarButton* cameraButton;
@property (nonatomic, strong) PtViewBarButton* filtersButton;
@property (nonatomic, strong) PtViewBarButton* slidersButton;

- (void)buttonCamerarollDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonInstagramDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonTwitterDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonFacebookDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonOtherDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonCameraDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonFiltersDidTouchUpInside:(PtViewBarButton*)button;
- (void)buttonSlidersDidTouchUpInside:(PtViewBarButton*)button;

@end
