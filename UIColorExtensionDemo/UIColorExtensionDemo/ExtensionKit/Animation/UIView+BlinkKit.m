//
//  UIView+BlinkKit.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2020/2/20.
//  Copyright © 2020 LeonDeng. All rights reserved.
//

#import "UIView+BlinkKit.h"

@import ObjectiveC.runtime;

@interface UIView()

@end

static NSString * const kLFAnimationKey = @"com.UIExtensionKit.Animation.blink";

@implementation UIView (BlinkKit)

- (CABasicAnimation *)blinkAnimtaionWithDuration:(CFTimeInterval)duration MinimumOpacity:(CGFloat)opacity RepeatCount:(NSInteger)repeatCount {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:opacity];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
    return animation;
}

- (void)blinkWithDuration:(CFTimeInterval)duration MinimumOpacity:(CGFloat)opacity RepeatCount:(NSInteger)repeatCount {
    [self.layer addAnimation:[self blinkAnimtaionWithDuration:duration MinimumOpacity:opacity RepeatCount:repeatCount] forKey:kLFAnimationKey];
}

- (void)constantBlinking {
    [self.layer addAnimation:[self blinkAnimtaionWithDuration:0.2 MinimumOpacity:0.f RepeatCount:MAXFLOAT] forKey:kLFAnimationKey];
}

- (void)stopBlinking {
    [self.layer removeAnimationForKey:kLFAnimationKey];
}

@end
