//
//  CYButton.h
//  CYButtonDemo
//
//  Created by cheny on 15/8/27.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CYFrame.h"

typedef enum : NSUInteger {
    CYButtonImageTitleTypeNomal,
    CYButtonImageTitleTypeRightLeft,
    CYButtonImageTitleTypeTopBottom,
    CYButtonImageTitleTypeBottomTop
} CYButtonImageTitleType;

@interface CYButton : UIButton

/** 按钮的图片&标题的显示类型 */
@property (nonatomic, assign) CYButtonImageTitleType imageTitleType;

/** 字体 */
@property (nonatomic, strong) UIFont *titleFont;

@end
