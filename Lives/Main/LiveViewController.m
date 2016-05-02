//
//  LiveViewController.m
//  Lives
//
//  Created by lisa on 16/4/30.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "LiveViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LiveViewController ()

@property (nonatomic, strong)       AVCaptureSession            * session;
//AVCaptureSession对象来执行输入设备和输出设备之间的数据传递

@property (nonatomic, strong) AVCaptureDevice   *cameraCaptureDevice;

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(clickCamera)];
    self.navigationItem.rightBarButtonItem = rightItem;
        
    [self initCaptureSource];
}

- (void)clickCamera {

}

- (void)initCaptureSource {
   
    __weak typeof(self) wself = self;
    void (^permissionGranted)(void) = ^{
        __strong typeof(wself) strongSelf = wself;
        
        NSArray *devices = [AVCaptureDevice devices];
        for (AVCaptureDevice *device in devices) {
            if ([device hasMediaType:AVMediaTypeVideo] && AVCaptureDevicePositionBack == device.position) {
                strongSelf.cameraCaptureDevice = device;
                break;
                
            }
        }
        
    };
     NSLog(@"....");
}


@end
