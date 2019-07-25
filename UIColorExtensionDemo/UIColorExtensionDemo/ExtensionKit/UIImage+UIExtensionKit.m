//
//  UIImage+UIExtensionKit.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/2/1.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import "UIImage+UIExtensionKit.h"

@implementation UIImage (UIExtensionKit)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageWithView:(UIView *)view Translucent:(BOOL)translucent {
    CGSize size = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, !translucent, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)subFittedImageFromImage:(UIImage *)image {
    CGSize imgSize =image.size;
    float minwidthFloat = imgSize.width;
    float minheightFloat = imgSize.height;
    UIImage* smallImage = image;
    if (minwidthFloat > [UIScreen mainScreen].bounds.size.width) {//320你自定义大小，想要弄多大，就弄多大
        minwidthFloat = [UIScreen mainScreen].bounds.size.width;
        minheightFloat = imgSize.height * minwidthFloat / imgSize.width;
        if (minheightFloat>[UIScreen mainScreen].bounds.size.height) {
            minheightFloat = [UIScreen mainScreen].bounds.size.width;
            minwidthFloat = imgSize.width*minheightFloat/imgSize.height;
        }
    }else{
        return smallImage;
    }
    smallImage = [self imageScaledFromImage:image Size:CGSizeMake(minwidthFloat, minheightFloat)];
    return smallImage;
}

+ (UIImage *)imageScaledFromImage:(UIImage *)image Size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)drawColorInImage:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    //  [[UIColor colorWithRed:222./255 green:227./255 blue: 229./255 alpha:1] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage * imge;// = [[UIImage alloc] init];
    imge = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imge;
}

+ (UIImage *)generateQRCodeImageViewWithString:(NSString *)dataString {
    // filter的名称必须是CIQRCodeGenerator且不能使用宏定义，否则无法生成二维码。
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    // 设置数据
    NSData *filterData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 滤镜对象kvc存值
    [filter setValue:filterData forKeyPath:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    NSLog(@"CIFilter Keys:%@",filter.inputKeys);
    CIImage *outImage = [filter outputImage];
    //此处在生产环境中应使用对象方法
    return [self createhdUIImageFormCIImage:outImage size:300];
}

+ (UIImage *)createhdUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)size {
    CGRect wsRect = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(wsRect), size / CGRectGetHeight(wsRect));
    //  1.二维码基本设置
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(wsRect) * scale;
    size_t height = CGRectGetHeight(wsRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef wsRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef wsImageRef = [context createCGImage:ciImage fromRect:wsRect];
    CGContextSetInterpolationQuality(wsRef, kCGInterpolationNone);
    CGContextScaleCTM(wsRef, scale, scale);
    CGContextDrawImage(wsRef, wsRect, wsImageRef);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(wsRef);
    CGContextRelease(wsRef);
    CGImageRelease(wsImageRef);
    return [UIImage imageWithCGImage:scaledImage]; // 黑白图片(到这里已经结束了)
}

- (UIImage *)imageWithTintColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size,NO, self.scale);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    UIRectFillUsingBlendMode(rect,kCGBlendModeNormal);
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)imageWithGrayScale {
    
    NSInteger RED = 3;
    NSInteger GREEN = 2;
    NSInteger BLUE = 1;
    
    CGSize size = [self size];
    int width = size.width;
    int height = size.height;
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t*)malloc(width * height *sizeof(uint32_t));
    // clear the pixels so any transparency is preserved
    memset(pixels,0, width * height *sizeof(uint32_t));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace =CGColorSpaceCreateDeviceRGB();
    // create a context with RGBA pixels
    CGContextRef context =CGBitmapContextCreate(pixels, width, height,8, width *sizeof(uint32_t), colorSpace,kCGBitmapByteOrder32Little|kCGImageAlphaPremultipliedLast);
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context,CGRectMake(0,0, width, height), self.CGImage);
    for(int y =0; y < height; y++)
    {
        for(int x =0; x < width; x++)
        {
            uint8_t*rgbaPixel = (uint8_t*) &pixels[y * width + x];
            // convert to grayscale using recommended method:http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray =0.3* rgbaPixel [RED] +0.59* rgbaPixel [GREEN] +0.11* rgbaPixel [BLUE];
            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image =CGBitmapContextCreateImage(context);
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    // we're done with image now too
    CGImageRelease(image);
    return resultUIImage;
}

- (void)saveImageToSandBox:(NSData*)image withName:(NSString*)imageName {
    NSString *path = [UIImage UIExtensionKitImagesFilePath];
    [image writeToFile:[path stringByAppendingPathComponent:imageName] atomically:YES];
}

+ (UIImage*)loadImageFromSandBox:(NSString*)imageName {
    NSString *path = [[UIImage UIExtensionKitImagesFilePath] stringByAppendingPathComponent:imageName];
    return [[UIImage alloc] initWithContentsOfFile:path];
}

+ (NSString *)UIExtensionKitImagesFilePath {
    //需优化，不能每次都判断
    static dispatch_once_t onceToken;
    NSString* SaveMediaPath= [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"UIExtensionKitMediaFileLib"];
    dispatch_once(&onceToken, ^{
        NSFileManager * fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:SaveMediaPath]) {
            [fileManager createDirectoryAtPath:SaveMediaPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    });
    return SaveMediaPath;
}

- (UIImage*)drawRoundedCornerWithRadius:(CGFloat)radius Size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIColor *)colorAtPixel:(CGPoint)point {
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIImage *)imageWithName:(NSString *)imageName Bundle:(NSString *)bundleName {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSString *imageDirectoryPath = [bundlePath stringByAppendingPathComponent:@"image"];
    NSString *imagePath = [imageDirectoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]];
    return [UIImage imageNamed:imagePath];
}

@end
