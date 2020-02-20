//
//  UIView+BlinkKit.h
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2020/2/20.
//  Copyright © 2020 LeonDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BlinkKit)

/// Add blink animation to view
/// @param duration animation spped
/// @param opacity choose between 0 ~ 1
/// @param repeatCount how many times the animation replays
- (void)blinkWithDuration:(CFTimeInterval)duration MinimumOpacity:(CGFloat)opacity RepeatCount:(NSInteger)repeatCount;

/// stop the view from blinking
- (void)stopBlinking;

/// Constantly blink the view
- (void)constantBlinking;

@end

NS_ASSUME_NONNULL_END
