//
//  UIView+UIExtensionKit.h
//  UIColorExtensionDemo
//
//  Created by Ivan_deng on 2019/5/23.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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
/// @param angel angle
- (void)tremble:(CGFloat)angle;
/// Stop view from shaking
- (void)stopTremble;

@end

NS_ASSUME_NONNULL_END
