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
    _bottomBar = [[PtViewBottomBar alloc] initWithFrame:CGRectMake(0.0f, [UIScreen height] - [PtSharedEditor bottomBarHeight], [UIScreen width], [PtSharedEditor bottomBarHeight])];
    
    //// Preview
    _imagePreview = [[PtViewImagePreview  alloc] initWithFrame:CGRectMake(0.0f, _topBar.height, [UIScreen width], [UIScreen height] - _topBar.height - _bottomBar.height)];
    _imagePreview.image = self.imageToProcess;
    [self.view addSubview:_imagePreview];
    
    [self.view addSubview:_topBar];
    [self.view addSubview:_bottomBar];
    
    //// Buttons - Top
    _camerarollButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeSaveToCameraRoll];
    [_camerarollButton addTarget:self action:@selector(buttonCamerarollDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addCamerarollButton:_camerarollButton];
    
    _instagramButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeInstagram];
    [_instagramButton addTarget:self action:@selector(buttonInstagramDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addInstagramButton:_instagramButton];
    
    _twitterButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeTwitter];
    [_twitterButton addTarget:self action:@selector(buttonTwitterDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addTwitterButton:_twitterButton];
    
    _facebookButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeFacebook];
    [_facebookButton addTarget:self action:@selector(buttonFacebookDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addFacebookButton:_facebookButton];
    
    _otherButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeOther];
    [_otherButton addTarget:self action:@selector(buttonOtherDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addOtherButton:_otherButton];
    
    //// Buttons - Bottom
    _cameraButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeBackToCamera];
    [_cameraButton addTarget:self action:@selector(buttonCameraDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBar addBackToCameraButton:_cameraButton];
    
    _filtersButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeFilters];
    [_filtersButton addTarget:self action:@selector(buttonFiltersDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBar addFiltersButton:_filtersButton];
    
    _slidersButton = [[PtViewBarButton alloc] initWithType:PtViewBarButtonTypeSliders];
    [_slidersButton addTarget:self action:@selector(buttonSlidersDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
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

#pragma mark button

- (void)buttonCamerarollDidTouchUpInside:(PtViewBarButton *)button
{
    
}

- (void)buttonInstagramDidTouchUpInside:(PtViewBarButton *)button
{
    
}

- (void)buttonTwitterDidTouchUpInside:(PtViewBarButton *)button
{
    
}

- (void)buttonFacebookDidTouchUpInside:(PtViewBarButton *)button
{
    
}

- (void)buttonOtherDidTouchUpInside:(PtViewBarButton *)button
{
    
}

- (void)buttonCameraDidTouchUpInside:(PtViewBarButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)buttonFiltersDidTouchUpInside:(PtViewBarButton *)button
{
    
}

- (void)buttonSlidersDidTouchUpInside:(PtViewBarButton *)button
{
    
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
