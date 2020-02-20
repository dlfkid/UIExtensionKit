//
//  UIView+PoppingKit.h
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2020/2/20.
//  Copyright © 2020 LeonDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PoppingKit)

@property (nonatomic, strong, readonly) UIView *maskView;

/// is need to dissmiss when tapped outside
@property (nonatomic, assign, getter = isRemainAfterTappedOutside) BOOL remainAfterTappedOutside;

/// dissmiss view from winbdow
/// @param animation need animation
/// @param completion callback when finished
- (void)dismissPopViewWithAnimation:(BOOL)animation Completion:(void(^ _Nullable )(void))completion;

/// showing the view from a specific view
/// @param view view as super view
/// @param maskAlpha the alpha value fot the mask view
/// @param animation need aniamtion
/// @param completion completion call back
- (void)showPoppingViewInView:(UIView * _Nullable)view MaskAlpha:(CGFloat)maskAlpha Animtaion:(BOOL)animation Completion:(void(^ _Nullable )(void))completion;


- (void)showPoppingViewInWindowWithCompletion:(void(^ _Nullable )(void))completion;

@end

NS_ASSUME_NONNULL_END
