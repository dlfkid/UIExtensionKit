//
//  UIImage+UIExtensionKit.h
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/2/1.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (UIExtensionKit)

/**
 Convert UIColor to UIImage
 
 @param color Color to transfer
 @return UImage
 */
+(UIImage*)imageWithColor:(UIColor*) color;

/**
 Convert UIView to UIImage
 
 @param view view to convert
 @return image from view
 */
+(UIImage*)imageWithView:(UIView*)view Translucent:(BOOL)translucent;

/**
 Return sub image from given image to adapt device's screen
 
 @param image resouce image
 @return subImage
 */
+(UIImage *)subFittedImageFromImage:(UIImage *)image;

/**
 Filled given image with color
 
 @param color which color you choosed to draw in picture
 @return UIImage
 */
+(UIImage *)drawColorInImage:(UIColor *)color;

/**
 Rescale images
 
 @param image original image
 @param size size you wanna scale to
 @return scaledImage
 */
+ (UIImage *)imageScaledFromImage:(UIImage *)image Size:(CGSize)size;

/**
 Generate QRCodeImageFromString

 @param dataString Data that going to be converted to QRCode in String
 @return QRCodeImage
 */
+ (UIImage *)generateQRCodeImageViewWithString:(NSString *)dataString;

/**
 To dye current image into given tint color

 @param color TintColor
 @return image converted to given tint color
 */
- (UIImage *)imageWithTintColor:(UIColor *)color;

/**
 Convert current image into gray form

 @return image with out color
 */
- (UIImage*)imageWithGrayScale;


/**
 Save given image into app's sandbox

 @param image Image to be saved
 @param imageName Image saved in name
 */
- (void)saveImageToSandBox:(NSData*)image withName:(NSString*)imageName;


/**
 Load image from sandBox

 @param imageName image's name
 @return UIImage
 */
- (UIImage*)loadImageFromSandBox:(NSString*)imageName;

@end

NS_ASSUME_NONNULL_END
