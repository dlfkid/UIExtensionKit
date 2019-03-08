# UpdateLog
### 2018-03-08
1.Add More UIImage Category Methods:
```
+ (UIImage *)generateQRCodeImageViewWithString:(NSString *)dataString;
- (UIImage *)imageWithTintColor:(UIColor *)color;
- (UIImage*)imageWithGrayScale;
- (void)saveImageToSandBox:(NSData*)image withName:(NSString*)imageName;
+ (UIImage*)loadImageFromSandBox:(NSString*)imageName;
```
for more detail, check the description in UIImageExtension chapter below.

2.Add CocoaPods installation compatible.

# Installation 

### CocoaPods
1. Add this line to your pod file
```
pod 'UIExtensionKit'
```
2. Run pod install

3. import the extenmsion like this
```
import <UIExtensionKit/UIImage+UIExtensionKit.h>
```

# UIExtensionKit
 Every developer has used such tools to build UI. But neither I don't want to write them every time I start a project nor I want to use other's frame work - which usually loaded with some other stuff and not showing what they are unless you look deeply into the header files, so this is it, pure and simple.

# Description

All method are implement as categories, So it's easy to call on use, just remember to import them first, I recommend importing them in your base VC or views, so all the subclasses can save the trouble.

# UIColorExtension
![alt text](/ImageResources/UIColorExtensions.png)

# UIImageExension
![alt text](/ImageResources/UIImageExtension.png)

# NSStringExtension
![alt text](/ImageResources/NSStringExtension.png)
