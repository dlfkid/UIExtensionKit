//
//  UILabel+UIKitExtension.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/6/19.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import "UILabel+UIKitExtension.h"

@implementation UILabel (UIKitExtension)

- (NSInteger)lines {
    // 总文字的高度
    CGFloat textH = [self.text boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil].size.height;
    // 每行文字的高度
    CGFloat lineHeight = self.font.lineHeight;
    // 行数
    NSInteger lineCount = textH / lineHeight;
    return lineCount;
}

//获取单行文字宽度
+ (CGFloat)textWidthWithText:(NSString *)text font:(UIFont *)font {
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return textSize.width;
}

//获取文字高度
+ (CGFloat)textHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font {
    if ([text isEqualToString:@""]) {
        return 0.0;
    } else {
        CGSize textSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
        return textSize.height + 2.0;
    }
}

//获取富文本高度
+ (CGFloat)textHeightWithAttributedText:(NSAttributedString *)attributted Width:(CGFloat)width {
    if (width <= 0) {
        return 0.0;
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0,0, width, MAXFLOAT)];
    lab.attributedText = attributted;
    lab.numberOfLines =0;
    
    CGSize labSize = [lab sizeThatFits:lab.bounds.size];
    
    return labSize.height + 5.0;
}

@end
