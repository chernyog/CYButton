//
//  CYButton.m
//  CYButtonDemo
//
//  Created by cheny on 15/8/27.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

#import "CYButton.h"

// 判断是否为iOS7以上
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@interface CYButton ()


@end

@implementation CYButton

#pragma mark - 生命周期方法
/**
 *  从文件中解析一个对象的时候就会调用这个方法
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        NSLog(@"cy ========== %s", __func__);
        [self setup];
    }
    return self;
}

///**
// *  通过代码创建控件的时候就会调用
// */
//- (id)initWithFrame:(CGRect)frame
//{
//    NSLog(@"cy ========== %s", __func__);
//    if (self = [super initWithFrame:frame]) {
//        [self setup];
//    }
//    return self;
//}

- (instancetype)init {
    NSLog(@"cy ========== %s", __func__);
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.titleLabel == nil && self.imageView == nil) return;

    if (self.imageTitleType == CYButtonImageTitleTypeNomal) {
        // 图片：左   文字：右
        CGFloat titleX = 0;
        CGFloat titleY = 0;
        NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
        CGFloat titleW;

        if (iOS7) {
#ifdef __IPHONE_7_0
            titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
#else
            titleW = [self.currentTitle sizeWithFont:self.titleFont].width;
#endif
        } else {
            titleW = [self.currentTitle sizeWithFont:self.titleFont].width;
        }
        CGFloat titleH = self.size.height;
        self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);

        CGFloat imageW = 30;
        CGFloat imageX = self.size.width - imageW;
        CGFloat imageY = 0;
        CGFloat imageH = self.size.height;
        self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);

    } else if (self.imageTitleType == CYButtonImageTitleTypeRightLeft) {
        // 图片：右   文字：左
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    } else if (self.imageTitleType == CYButtonImageTitleTypeTopBottom) {
        // 图片：上   文字：下
        CGSize titleSize;
        NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
        if (iOS7) {
#ifdef __IPHONE_7_0
            titleSize = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
#else
            titleSize = [self.currentTitle sizeWithFont:self.titleFont];
#endif
        } else {
            titleSize = [self.currentTitle sizeWithFont:self.titleFont];
        }
        CGFloat titleX = 0;
        CGFloat titleY = self.height - titleSize.height;
        CGFloat titleW = titleSize.width;
        CGFloat titleH = titleSize.height;

        titleY = self.height * 0.5 + 10;
        self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);

        CGFloat imageW = self.currentImage.size.width;
        CGFloat imageX = 0;
        CGFloat imageY = 0;
        CGFloat imageH = self.currentImage.size.height;

        imageY = self.height * 0.5 - imageH;
        self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        self.imageView.centerX = self.titleLabel.centerX;

    } else if (self.imageTitleType == CYButtonImageTitleTypeBottomTop) {
        // 图片：下   文字：上

    }

    NSLog(@"\n\n\n");
}

#pragma mark - 实现按钮内部方法
///**
// *  控制器内部label的frame
// *  contentRect : 按钮自己的边框
// */
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    NSLog(@"cy ========== %s", __func__);
//    CGFloat titleX = 0;
//    CGFloat titleY = 0;
//    NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
//    CGFloat titleW;
//
//    if (iOS7) {
//#ifdef __IPHONE_7_0
//        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
//#else
//        titleW = [self.currentTitle sizeWithFont:self.titleFont].width;
//#endif
//    } else {
//        titleW = [self.currentTitle sizeWithFont:self.titleFont].width;
//    }
//    CGFloat titleH = contentRect.size.height;
//    return CGRectMake(titleX, titleY, titleW, titleH);
//}
//
///**
// *  控制器内部imageView的frame
// */
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    NSLog(@"cy ========== %s", __func__);
//    CGFloat imageW = 30;
//    CGFloat imageX = contentRect.size.width - imageW;
//    CGFloat imageY = 0;
//    CGFloat imageH = contentRect.size.height;
//    return CGRectMake(imageX, imageY, imageW, imageH);
//}

#pragma mark  - Set方法
- (void)setImageTitleType:(CYButtonImageTitleType)imageTitleType {
    _imageTitleType = imageTitleType;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = self.titleFont;
}

//- (void)setTitle:(NSString *)title forState:(UIControlState)state {
//    self.titleLabel.text = title;
//}
//
//- (void)setImage:(UIImage *)image forState:(UIControlState)state {
//    self.imageView.image = image;
//}

#pragma mark - 私有方法
- (void)setup {
    self.titleFont = [UIFont systemFontOfSize:14];

    // 图标居中
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageTitleType = CYButtonImageTitleTypeNomal;

    self.titleLabel.backgroundColor = [UIColor greenColor];
//    self.imageView.backgroundColor = [UIColor purpleColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleEdgeInsets = UIEdgeInsetsMake(-20, 20, 20, 20);
}

@end
