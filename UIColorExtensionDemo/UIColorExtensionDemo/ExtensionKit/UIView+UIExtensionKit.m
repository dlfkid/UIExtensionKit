//
//  UIView+UIExtensionKit.m
//  UIColorExtensionDemo
//
//  Created by Ivan_deng on 2019/5/23.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import "UIView+UIExtensionKit.h"

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

- (void)setShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(ShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth {
    self.layer.masksToBounds = NO;
    
    self.layer.shadowColor = shadowColor.CGColor;
    
    self.layer.shadowOpacity = shadowOpacity;
    
    self.layer.shadowRadius =  shadowRadius;
    
    self.layer.shadowOffset = CGSizeZero;
    CGRect shadowRect;
    
    CGFloat originX = 0;
    
    CGFloat originY = 0;
    
    CGFloat originW = self.bounds.size.width;
    
    CGFloat originH = self.bounds.size.height;
    
    
    switch (shadowPathSide) {
        case ShadowPathSideTop:
            shadowRect  = CGRectMake(originX, originY - shadowPathWidth/2, originW,  shadowPathWidth);
            break;
        case ShadowPathSideBottom:
            shadowRect  = CGRectMake(originX, originH -shadowPathWidth/2, originW, shadowPathWidth);
            break;
            
        case ShadowPathSideLeft:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
            
        case ShadowPathSideRight:
            shadowRect  = CGRectMake(originW - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
        case ShadowPathSideNoTop:
            shadowRect  = CGRectMake(originX -shadowPathWidth/2, originY +1, originW +shadowPathWidth,originH + shadowPathWidth/2 );
            break;
        case ShadowPathSideAllSide:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
            break;
            
    }
    
    UIBezierPath *path =[UIBezierPath bezierPathWithRect:shadowRect];
    
    self.layer.shadowPath = path.CGPath;
}

@end
