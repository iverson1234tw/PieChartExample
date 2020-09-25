//
//  ScanViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/25.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "ScanViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ScanViewController () <AVCaptureMetadataOutputObjectsDelegate> {
    TopBarView *topBar;
}
@property (strong, nonatomic) UILabel *stateLabel;
@property (strong, nonatomic) UIView *scanView;

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL isReading;
 
-(BOOL)startReading;
-(void)stopReading;

@end

@implementation ScanViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self init_main_view];

}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    [self startReading];
    
}

- (void)init_main_view {
    
    topBar = [[TopBarView alloc] initWithFrame:CGRectZero];
    topBar.titleLabel.text = @"QRCode Scanner";
    topBar.additionButton.hidden = true;
    topBar.backButton.hidden = true;
    
    [self.view addSubview:topBar];
    
    _scanView = [[UIView alloc] initWithFrame:CGRectZero];
    _scanView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_scanView];
    
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@70);
        
    }];
    
    [_scanView mas_makeConstraints:^(MASConstraintMaker *make) {
               
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view);
        make.width.height.mas_equalTo(self.view.mas_width).multipliedBy(0.8);
        
    }];
    
}

- (BOOL)startReading {
    NSError *error;
     
    // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
    // as the media type parameter.
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
     
    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
     
    if (!input) {
        // If any error occurs, simply log the description of it and don't continue any more.
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
     
    // Initialize the captureSession object.
    _captureSession = [[AVCaptureSession alloc] init];
    // Set the input device on the capture session.
    [_captureSession addInput:input];
     
    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
     
    // Create a new serial dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[captureMetadataOutput availableMetadataObjectTypes]];
 
    // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_scanView.layer.bounds];
    [_scanView.layer addSublayer:_videoPreviewLayer];
          
    // Start video capture.
    [_captureSession startRunning];
     
    return YES;
}
 
-(void)stopReading{
    // Stop video capture and make the capture session object nil.
    [_captureSession stopRunning];
    _captureSession = nil;
     
    // Remove the video preview layer from the viewPreview view's layer.
    [_videoPreviewLayer removeFromSuperlayer];
}
 
#pragma mark - AVCaptureMetadataOutputObjectsDelegate method implementation
 
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
     
    // Check if the metadataObjects array is not nil and it contains at least one object.
    if (metadataObjects != nil && [metadataObjects count] == 0) {
         
        NSLog(@"Result:%@", metadataObjects);
        // Get the metadata object.
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeCode93Code] || [[metadataObj type] isEqualToString:AVMetadataObjectTypeCode128Code]) {
            // If the found metadata is equal to the QR code metadata then update the status label's text,
            // stop reading and change the bar button item's title and the flag's value.
            // Everything is done on the main thread.
            // 掃瞄完畢停止重複掃描
            [self stopReading];
 
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
             
            _isReading = NO;
        }
    }
    
}

@end
