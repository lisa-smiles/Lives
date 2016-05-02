//
//  ViewController.m
//  Lives
//
//  Created by lisa on 16/4/30.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "ViewController.h"
//#import <PLCameraStreamingKit/PLCameraStreamingKit.h>
//#import <PLStreamingKit.h>

@interface ViewController ()
//<PLCameraStreamingSessionDelegate>

//@property (nonatomic, strong) PLStream *stream;
//@property(nonatomic, strong) PLCameraStreamingSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    NSDictionary *streamJSON;
//    PLStream *stream = [PLStream streamWithJSON:streamJSON];
//    
//    void(^permissionBlock)(void) = ^{
//        PLVideoStreamingConfiguration *videoConfiguration = [PLVideoStreamingConfiguration defaultConfiguration];
//        PLAudioStreamingConfiguration *audioConfiguration = [PLAudioStreamingConfiguration defaultConfiguration];
//        self.session= [[PLCameraStreamingSession alloc] initWithVideoConfiguration:videoConfiguration audioConfiguration:audioConfiguration stream:stream videoOrientation:(AVCaptureVideoOrientationPortrait)];
//        self.session.delegate = self;
//        self.session.previewView = self.view;
//    };
//    void (^noPermissionBlock)(void) = ^{
//        // 处理未授权情况
//    };
//    //
//    PLAuthorizationStatus status = [PLCameraStreamingSession cameraAuthorizationStatus];
//    if (PLAuthorizationStatusNotDetermined == status) {
//        [PLCameraStreamingSession requestCameraAccessWithCompletionHandler:^(BOOL granted) {
//        // 回调确保在主线程，可以安全对 UI 做操作
//            granted ? permissionBlock() : noPermissionBlock();
//            
//        }];
//
//    } else if (PLAuthorizationStatusAuthorized == status) {
//        permissionBlock();
//    } else {
//        noPermissionBlock();
//    }
}

@end
