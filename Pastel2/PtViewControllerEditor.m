//
//  PtViewControllerEditor.m
//  Pastel2
//
//  Created by SSC on 2014/05/27.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtViewControllerEditor.h"

@interface PtViewControllerEditor ()

@end

@implementation PtViewControllerEditor

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [PtSharedEditor bgColor];
    
    //// Bar
    _topBar = [[PtViewTopBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen width], [PtSharedEditor topBarHeight])];
    [self.view addSubview:_topBar];
    _bottomBar = [[PtViewBottomBar alloc] initWithFrame:CGRectMake(0.0f, [UIScreen height] - [PtSharedEditor bottomBarHeight], [UIScreen width], [PtSharedEditor bottomBarHeight])];
    [self.view addSubview:_bottomBar];
    
    //// Buttons - Top
    _camerarollButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeSaveToCameraRoll];
    [_topBar addCamerarollButton:_camerarollButton];
    _instagramButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeInstagram];
    [_topBar addInstagramButton:_instagramButton];
    _twitterButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeTwitter];
    [_topBar addTwitterButton:_twitterButton];
    _facebookButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeFacebook];
    [_topBar addFacebookButton:_facebookButton];
    _otherButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeOther];
    [_topBar addOtherButton:_otherButton];
    
    //// Buttons - Bottom
    _cameraButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeBackToCamera];
    [_bottomBar addBackToCameraButton:_cameraButton];
    _filtersButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeFilters];
    [_bottomBar addFiltersButton:_filtersButton];
    _slidersButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeFilters];
    [_bottomBar addSlidersButton:_slidersButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
