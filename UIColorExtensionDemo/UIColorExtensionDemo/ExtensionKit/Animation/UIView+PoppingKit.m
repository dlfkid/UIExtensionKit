//
//  UIView+PoppingKit.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2020/2/20.
//  Copyright © 2020 LeonDeng. All rights reserved.
//

#import "UIView+PoppingKit.h"

@import ObjectiveC.runtime;

@interface UIView()

@property (nonatomic, strong) NSNumber *remainAfterTappedOutSideNumber;

@end


@implementation UIView (PoppingKit)

- (BOOL)isRemainAfterTappedOutside {
    return self.remainAfterTappedOutSideNumber.boolValue;
}

- (void)setRemainAfterTappedOutside:(BOOL)remainAfterTappedOutside {
    self.remainAfterTappedOutSideNumber = @(remainAfterTappedOutside);
}

- (NSNumber *)remainAfterTappedOutSideNumber {
    return objc_getAssociatedObject(self, @"remainAfterTappedOutSideNumber");
}

- (void)setRemainAfterTappedOutSideNumber:(NSNumber *)remainAfterTappedOutSideNumber {
    objc_setAssociatedObject(self, @"remainAfterTappedOutSideNumber", remainAfterTappedOutSideNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)maskView {
    UIView *coverView = objc_getAssociatedObject(self, _cmd);
    if (!coverView) {
        UIView *tempCoverView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        tempCoverView.backgroundColor = [UIColor blackColor];//调节背景是否透明

        UITapGestureRecognizer *recognizerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapgestureAction:)];
        
        recognizerTap.numberOfTapsRequired = 1;
        [tempCoverView addGestureRecognizer:recognizerTap];
        objc_setAssociatedObject(self, _cmd, tempCoverView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    coverView = objc_getAssociatedObject(self, _cmd);
    return coverView;
}

- (void)tapgestureAction:(id)sender {
    if (!self.isRemainAfterTappedOutside) {
        [self dismissPopViewWithAnimation:YES Completion:nil];
    }
}

- (void)dismissPopViewWithAnimation:(BOOL)animation Completion:(void(^ _Nullable )(void))completion {
    //淡出动画
    if (animation) {
        [UIView transitionWithView:self duration:0.2f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.alpha = 0;
            self.maskView.alpha = 0;
        } completion:
         ^(BOOL finished) {
            [self.maskView removeFromSuperview];
            [self removeFromSuperview];
            !completion ?: completion();
        }];
    } else {
        self.alpha = 0;
        self.maskView.alpha = 0;
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
        !completion ?: completion();
    }
}

- (void)showPoppingViewInView:(UIView *)view MaskAlpha:(CGFloat)maskAlpha Animtaion:(BOOL)animation Completion:(void(^ _Nullable )(void))completion {
    //动画准备
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.maskView.alpha = 0;
    //蒙层
    if (view) {
        [view addSubview:self.maskView];
        [view addSubview:self];
    } else {
        [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    [[UIApplication sharedApplication].keyWindow layoutIfNeeded];
    
    //动画淡入加缩放
    if (animation) {
        [UIView transitionWithView:self duration:0.2f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.alpha = 1;
            self.maskView.alpha = maskAlpha;
            self.transform = CGAffineTransformIdentity;
        } completion: ^(BOOL finished) {
            !completion ?: completion();
        }];
    } else {
        self.alpha = 1;
        self.maskView.alpha = maskAlpha;
        self.transform = CGAffineTransformIdentity;
        !completion ?: completion();
    }
    
}

- (void)showPoppingViewInWindowWithCompletion:(void(^ _Nullable )(void))completion {
    [self showPoppingViewInView:nil MaskAlpha:0.4 Animtaion:YES Completion:completion];
}

@end
