//
//  VnViewEditorToolBarButton.h
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PtFtViewToolBarButtonType){
    PtFtViewToolBarButtonTypeShuffle = 1,
    PtFtViewToolBarButtonTypeSlider,
    PtFtViewToolBarButtonTypeFavorites,
    PtFtViewToolBarButtonTypeAddToFavorites,
    PtFtViewToolBarButtonTypeCancel,
    PtFtViewToolBarButtonTypeDone
};

@class PtFtViewToolBarButton;

@protocol VnViewEditorToolBarButtonDelegate
- (void)didToolBarButtonTouchUpInside:(PtFtViewToolBarButton*)button;
@end

@interface PtFtViewToolBarButton : UIButton

@property (nonatomic, weak) id<VnViewEditorToolBarButtonDelegate> delegate;
@property (nonatomic, assign) PtFtViewToolBarButtonType type;

- (void)didTouchUpInside:(PtFtViewToolBarButton*)sender;

@end
