//
//  UIView+UIExtensionKit.m
//  UIColorExtensionDemo
//
//  Created by Ivan_deng on 2019/5/23.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#define angleToRandian(x)  ((x)/180.0*M_PI)

#import "UIView+UIExtensionKit.h"

static NSString * const kTrembleKey = @"com.tcl.home.animationKey.tremble";

@implementation UIView (UIExtensionKit)

- (CGFloat)frameX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)frameY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)frameWidth {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)frameHeight {
    return CGRectGetHeight(self.frame);
}

- (CGFloat)boundX {
    return CGRectGetMinX(self.bounds);
}

- (CGFloat)boundY {
    return CGRectGetMinY(self.bounds);
}

- (CGFloat)boundWidth {
    return CGRectGetWidth(self.bounds);
}

- (CGFloat)boundHeight {
    return CGRectGetHeight(self.bounds);
}

- (void)tremble:(CGFloat)angle; {
    CAKeyframeAnimation* anim=[CAKeyframeAnimation animation];
    anim.keyPath=@"transform.rotation";
    anim.values=@[@(angleToRandian(-angle)),@(angleToRandian(angle)),@(angleToRandian(-angle))];
    anim.repeatCount=MAXFLOAT;
    anim.duration=0.2;
    [self.layer addAnimation:anim forKey:kTrembleKey];
}

- (void)stopTremble {
    [self.layer removeAnimationForKey:kTrembleKey];
}

@end
