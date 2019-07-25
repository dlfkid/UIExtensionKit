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
+ (UIImage*)loadImageFromSandBox:(NSString*)imageName;


/**
 Draw rounded corners to image and improve performance

 @param radius corner radius
 @param size image size
 @return image with rounded corners
 */
- (UIImage*)drawRoundedCornerWithRadius:(CGFloat)radius Size:(CGSize)size;

/**
 Get color at point
 
 @param point corner radius
 @return color at given point
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/**
 Get image from bundle
 
 @param imageName image name in bundle
 @param bundleName name of the bundle
 @return image from bundle
 */
+ (UIImage *)imageWithName:(NSString *)imageName Bundle:(NSString *)bundleName;

@end

NS_ASSUME_NONNULL_END
