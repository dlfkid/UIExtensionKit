//
//  ViewController.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/2/1.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+UIExtensionKit.h"
#import "UIView+PoppingKit.h"
#import "UIView+TrembleKit.h"
#import "UIView+BlinkKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"sample"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.layer.masksToBounds = YES;
    imageView.image = [image drawRoundedCornerWithRadius:20 Size:CGSizeMake(300, 300)];
    
    [self.view addSubview:imageView];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    testView.backgroundColor = [UIColor redColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        __weak UIView *weakView = testView;
        
        [testView showPoppingViewInWindowWithCompletion:^{
            [weakView tremble:90 Duration:0.3];
        }];
        
        [imageView blinkWithDuration:0.3 MinimumOpacity:0.1 RepeatCount:10];
    });
}


@end
