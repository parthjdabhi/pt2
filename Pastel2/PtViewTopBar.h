//
//  PtViewTopBar.h
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PtViewBarButton.h"

@interface PtViewTopBar : UIView

- (void)addInstagramButton:(PtViewBarButton*)button;
- (void)addTwitterButton:(PtViewBarButton*)button;
- (void)addFacebookButton:(PtViewBarButton*)button;
- (void)addOtherButton:(PtViewBarButton*)button;
- (void)addCamerarollButton:(PtViewBarButton*)button;

@end
