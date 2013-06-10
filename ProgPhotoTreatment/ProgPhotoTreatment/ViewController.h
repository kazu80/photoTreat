//
//  ViewController.h
//  ProgPhotoTreatment
//
//  Created by kazuyoshi kawakami on 13/06/09.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationBarDelegate,UIImagePickerControllerDelegate>

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)clickDisp:(id)sender;
- (IBAction)clickRotate:(id)sender;
- (IBAction)clickMask:(id)sender;
- (IBAction)clickOpen:(id)sender;
- (IBAction)clickSave:(id)sender;

@end
