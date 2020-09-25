//
//  HomeTabBarViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/25.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "HomeTabBarViewController.h"

@interface HomeTabBarViewController ()

@end

@implementation HomeTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self tabbar_init];
    
}

- (void)tabbar_init {
    
    UITabBarItem *home = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *chart = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *qrcodeScan = [self.tabBar.items objectAtIndex:2];
    
    [home setTitle:@"Home"];
    [chart setTitle:@"Charts"];
    [qrcodeScan setTitle:@"QRCode"];
    
}

@end
