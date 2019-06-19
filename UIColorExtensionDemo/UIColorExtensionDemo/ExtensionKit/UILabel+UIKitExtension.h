//
//  UILabel+UIKitExtension.h
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/6/19.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (UIKitExtension)

/// Current number of linse in label better use it after label was layouted
@property (nonatomic, assign, readonly) NSInteger lines;

/**
 Height of a label with single line
 
 @param text text
 @param font font
 @return height
 */
+ (CGFloat)textWidthWithText:(NSString *)text font:(UIFont *)font;

/**
 Height of a label
 
 @param text Text
 @param width width
 @param font Font
 @return Height
 */
+ (CGFloat)textHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

/**
 Height of a label with attribute text
 
 @param attributted attribute text
 @param width width
 @return height
 */
+ (CGFloat)textHeightWithAttributedText:(NSAttributedString *)attributted Width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
