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
    self.view.backgroundColor = [PtEdConfig bgColor];
    
    //// Bar
    _topBar = [[PtEdViewTopBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen width], [PtEdConfig topBarHeight])];
    _bottomBar = [[PtEdViewBottomBar alloc] initWithFrame:CGRectMake(0.0f, [UIScreen height] - [PtEdConfig bottomBarHeight], [UIScreen width], [PtEdConfig bottomBarHeight])];
    
    //// Preview
    _imagePreview = [[PtEdViewImagePreview  alloc] initWithFrame:CGRectMake(0.0f, _topBar.height, [UIScreen width], [UIScreen height] - _topBar.height - _bottomBar.height)];
    _imagePreview.image = [PtSharedApp instance].imageToProcess;
    [self.view addSubview:_imagePreview];
    
    [self.view addSubview:_topBar];
    [self.view addSubview:_bottomBar];
    
    //// Buttons - Top
    _camerarollButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeSaveToCameraRoll];
    [_camerarollButton addTarget:self action:@selector(buttonCamerarollDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addCamerarollButton:_camerarollButton];
    
    _instagramButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeInstagram];
    [_instagramButton addTarget:self action:@selector(buttonInstagramDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addInstagramButton:_instagramButton];
    
    _twitterButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeTwitter];
    [_twitterButton addTarget:self action:@selector(buttonTwitterDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addTwitterButton:_twitterButton];
    
    _facebookButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeFacebook];
    [_facebookButton addTarget:self action:@selector(buttonFacebookDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addFacebookButton:_facebookButton];
    
    _otherButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeOther];
    [_otherButton addTarget:self action:@selector(buttonOtherDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addOtherButton:_otherButton];
    
    //// Buttons - Bottom
    _cameraButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeBackToCamera];
    [_cameraButton addTarget:self action:@selector(buttonCameraDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBar addBackToCameraButton:_cameraButton];
    
    _filtersButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeFilters];
    [_filtersButton addTarget:self action:@selector(buttonFiltersDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBar addFiltersButton:_filtersButton];
    
    _slidersButton = [[PtEdViewBarButton alloc] initWithType:PtEdViewBarButtonTypeSliders];
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

- (void)buttonCamerarollDidTouchUpInside:(PtEdViewBarButton *)button
{
    
}

- (void)buttonInstagramDidTouchUpInside:(PtEdViewBarButton *)button
{
    
}

- (void)buttonTwitterDidTouchUpInside:(PtEdViewBarButton *)button
{
    
}

- (void)buttonFacebookDidTouchUpInside:(PtEdViewBarButton *)button
{
    
}

- (void)buttonOtherDidTouchUpInside:(PtEdViewBarButton *)button
{
    
}

- (void)buttonCameraDidTouchUpInside:(PtEdViewBarButton *)button
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)buttonFiltersDidTouchUpInside:(PtEdViewBarButton *)button
{
    PtViewControllerFilters* con = [[PtViewControllerFilters alloc] init];
    [self.navigationController pushViewController:con animated:NO];
}

- (void)buttonSlidersDidTouchUpInside:(PtEdViewBarButton *)button
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
