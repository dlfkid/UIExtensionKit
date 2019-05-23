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

@end
