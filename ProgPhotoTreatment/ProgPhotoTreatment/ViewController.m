//
//  ViewController.m
//  ProgPhotoTreatment
//
//  Created by kazuyoshi kawakami on 13/06/09.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
- (IBAction)clickDisp:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"hondatubasa02" ofType:@"jpg"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    self.imageView.image = image;
}

- (IBAction)clickRotate:(id)sender {
    UIImage *img = self.imageView.image;
    CGImageRef imgRef = [img CGImage];
    UIGraphicsBeginImageContext(CGSizeMake(img.size.height, img.size.width));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, img.size.height, img.size.width);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, M_PI/2.0);
    CGContextDrawImage(context, CGRectMake(0, 0, img.size.width, img.size.height), imgRef);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image = image;
}

- (IBAction)clickMask:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"mask" ofType:@"jpg"];
    UIImage *maskImage = [[UIImage alloc] initWithContentsOfFile:path];
    CGImageRef maskRef = maskImage.CGImage;
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef), CGImageGetHeight(maskRef), CGImageGetBitsPerComponent(maskRef), CGImageGetBitsPerPixel(maskRef), CGImageGetBytesPerRow(maskRef), CGImageGetDataProvider(maskRef), NULL, false);
    CGImageRef masked = CGImageCreateWithMask([self.imageView.image CGImage], mask);
    UIImage *image = [UIImage imageWithCGImage:masked];
    self.imageView.image = image;
}

- (IBAction)clickOpen:(id)sender {
}

- (IBAction)clickSave:(id)sender {
    // 保存する
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, nil, nil, nil);
}
@end
