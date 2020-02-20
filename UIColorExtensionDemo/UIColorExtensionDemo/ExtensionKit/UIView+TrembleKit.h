//
//  UIView+TrembleKit.h
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2020/2/20.
//  Copyright © 2020 LeonDeng. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TrembleKit)

/// View will shake like app is going to been deleted in iOS
/// @param angle angle
/// @param duration animtaion duration for each loop
- (void)tremble:(CGFloat)angle Duration:(CFTimeInterval)duration;

/// Stop view from shaking
- (void)stopTremble;

@end

NS_ASSUME_NONNULL_END
