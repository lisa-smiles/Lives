//
//  MainTableViewController.m
//  Lives
//
//  Created by lisa on 16/4/30.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "MainTableViewController.h"
#import <PLCameraStreamingKit/PLCameraStreamingKit.h>
#import <PLStreamingKit.h>

@interface MainTableViewController ()<PLCameraStreamingSessionDelegate>
@property (nonatomic, strong) PLStream *stream;
@property(nonatomic, strong) PLCameraStreamingSession *session;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSDictionary *streamJSON;
    PLStream *stream = [PLStream streamWithJSON:streamJSON];
    
    void(^permissionBlock)(void) = ^{
        PLVideoStreamingConfiguration *videoConfiguration = [PLVideoStreamingConfiguration defaultConfiguration];
        PLAudioStreamingConfiguration *audioConfiguration = [PLAudioStreamingConfiguration defaultConfiguration];
        self.session= [[PLCameraStreamingSession alloc] initWithVideoConfiguration:videoConfiguration audioConfiguration:audioConfiguration stream:stream videoOrientation:(AVCaptureVideoOrientationPortrait)];
        self.session.delegate = self;
        self.session.previewView = self.view;
        NSLog(@"Permission");

    };
    
    void (^noPermissionBlock)(void) = ^{
        // 处理未授权情况
        NSLog(@"noPermission");
    };
    
    PLAuthorizationStatus status = [PLCameraStreamingSession cameraAuthorizationStatus];
    
    if (PLAuthorizationStatusNotDetermined == status) {
        [PLCameraStreamingSession requestCameraAccessWithCompletionHandler:^(BOOL granted) {
            // 回调确保在主线程，可以安全对 UI 做操作
            granted ? permissionBlock() : noPermissionBlock();
            
        }];
        
    } else if (PLAuthorizationStatusAuthorized == status) {
        permissionBlock();
    } else {
        noPermissionBlock();
    }
    
    [self.session startWithCompleted:^(BOOL success) {
        // 这里的代码在主线程运行，所以可以放心对 UI 控件做操作
        if (success) {
            // 连接成功后的处理
            
            // 成功后，在这里才可以读取 self.session.pushURL，start 失败和之前不能确保读取到正确的 URL
            
        } else {
            // 连接失败后的处理
        }
    }];
//
//    // 停止推流
//    [self.session stop];

    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"www.baidu.com";
    return cell;
}

/// @abstract 摄像头授权状态发生变化的回调
- (void)cameraStreamingSession:(PLCameraStreamingSession *)session didGetCameraAuthorizationStatus:(PLAuthorizationStatus)status {
    NSLog(@"...");
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
