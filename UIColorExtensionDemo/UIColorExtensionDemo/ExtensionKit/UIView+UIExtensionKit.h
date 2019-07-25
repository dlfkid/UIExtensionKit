//
//  UIView+UIExtensionKit.h
//  UIColorExtensionDemo
//
//  Created by Ivan_deng on 2019/5/23.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ShadowPathSide) {
    ShadowPathSideLeft,
    ShadowPathSideRight,
    ShadowPathSideTop,
    ShadowPathSideBottom,
    ShadowPathSideNoTop,
    ShadowPathSideAllSide,
};

@interface UIView (UIExtensionKit)

@property (nonatomic, assign, readonly) CGFloat frameX;
@property (nonatomic, assign, readonly) CGFloat frameY;
@property (nonatomic, assign ,readonly) CGFloat frameWidth;
@property (nonatomic, assign ,readonly) CGFloat frameHeight;

@property (nonatomic, assign, readonly) CGFloat boundX;
@property (nonatomic, assign, readonly) CGFloat boundY;
@property (nonatomic, assign ,readonly) CGFloat boundWidth;
@property (nonatomic, assign ,readonly) CGFloat boundHeight;

/// View will shake like app is going to been deleted in iOS
/// @param angle angle
- (void)tremble:(CGFloat)angle;

/// Stop view from shaking
- (void)stopTremble;

/// Convenient Set Shadow
/// @param shadowColor shadowColor
/// @param shadowOpacity shadowOpacity
/// @param shadowRadius shadowRadius
/// @param shadowPathSide shadowPathSide
/// @param shadowPathWidth shadowPathWidth
- (void)setShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(ShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth;

@end

NS_ASSUME_NONNULL_END
