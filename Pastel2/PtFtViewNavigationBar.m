//
//  PtFtViewNavigationBar.m
//  Pastel2
//
//  Created by SSC on 2014/06/01.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtFtViewNavigationBar.h"

@implementation PtFtViewNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [PtSharedApp bottomNavigationBarBgColor];
    }
    return self;
}

- (void)addDoneButton:(PtFtButtonNavigation *)button
{
    
}

- (void)addCancelButton:(PtFtButtonNavigation *)button
{
    
}

@end
