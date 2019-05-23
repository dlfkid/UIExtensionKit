//
//  ViewController.m
//  UIColorExtensionDemo
//
//  Created by LeonDeng on 2019/2/1.
//  Copyright © 2019 LeonDeng. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+UIExtensionKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"sample"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.layer.masksToBounds = YES;
    imageView.image = [image drawRoundedCornerWithRadius:20 Size:CGSizeMake(300, 300)];
    [self.view addSubview:imageView];
}


@end
