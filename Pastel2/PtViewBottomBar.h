//
//  PtViewBottomBar.h
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PtViewBarButton.h"

@interface PtViewBottomBar : UIView

- (void)addBackToCameraButton:(PtViewBarButton*)button;
- (void)addFiltersButton:(PtViewBarButton*)button;
- (void)addSlidersButton:(PtViewBarButton*)button;

@end
