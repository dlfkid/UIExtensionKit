//
//  UIView+TrembleKit.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2020/2/20.
//  Copyright © 2020 LeonDeng. All rights reserved.
//

#import "UIView+TrembleKit.h"

#define angleToRandian(x)  ((x)/180.0*M_PI)

static NSString * const kTrembleKey = @"com.tcl.home.animationKey.tremble";

@implementation UIView (TrembleKit)

- (void)tremble:(CGFloat)angle Duration:(CFTimeInterval)duration {
    CAKeyframeAnimation* anim=[CAKeyframeAnimation animation];
    anim.keyPath=@"transform.rotation";
    anim.values=@[@(angleToRandian(-angle)),@(angleToRandian(angle)),@(angleToRandian(-angle))];
    anim.repeatCount=MAXFLOAT;
    anim.duration=duration;
    [self.layer addAnimation:anim forKey:kTrembleKey];
}

- (void)stopTremble {
    [self.layer removeAnimationForKey:kTrembleKey];
}

@end
