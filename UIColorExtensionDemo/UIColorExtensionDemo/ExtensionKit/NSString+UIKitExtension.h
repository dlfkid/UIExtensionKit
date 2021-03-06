//
//  NSString+UIKitExtension.h
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/2/1.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (UIKitExtension)

/**
 Convert hexString into string
 
 @param hexString HexString that be converted
 @return string
 */
+ (NSString *)stringWithHexString:(NSString *)hexString;

/**
 Convert string into hexString
 
 @param string Sting that be converted
 @return hexString
 */
+ (NSString *)hexStringWithString:(NSString *)string;

/// return a string from sttring array that separated with separator.
/// @param array string array
/// @param separator separator
+ (NSString *)stringWithArray:(NSArray <NSString *> *)array Separator:(NSString *)separator;

@end

NS_ASSUME_NONNULL_END
