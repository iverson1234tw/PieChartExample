//
//  AreaChartViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/25.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "AreaChartViewController.h"

@interface AreaChartViewController ()

@property (strong, nonatomic) AAChartView *aaChartView;

@end

@implementation AreaChartViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self init_main_view];
    
}

- (void)init_main_view {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TopBarView *topBar = [[TopBarView alloc] initWithFrame:CGRectZero];
    topBar.titleLabel.text = @"Line Chart";
    [topBar.backButton addTarget:self action:@selector(doneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:topBar];
    
    _aaChartView = [[AAChartView alloc] initWithFrame:CGRectZero];
    _aaChartView.scrollEnabled = YES;
    _aaChartView.layer.cornerRadius = 2.5f;
    _aaChartView.layer.masksToBounds = YES;
    
    [self.view addSubview:_aaChartView];
    
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@60);
        
    }];
    
    [_aaChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view).multipliedBy(0.5);
        
    }];
    
    [_aaChartView aa_drawChartWithChartModel:[self configure_chart]];
    
}

- (AAChartModel *)configure_chart {
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"带有负数的区域填充图")
    .markerRadiusSet(@0)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineWidthSet(@0)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"HTML",@"CSS",@"Perl",@"R",@"MATLAB",@"SQL"])
    .colorsThemeSet(@[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@0, @(-7.5), @(-1.0), @3.7, @0, @(-3), @8, @0,@(-3.6), @4, @(-2), @0]),
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0, @(-2.2), @2, @(-2.2), @0, @(-1.5), @0, @2.4, @(-1), @3, @(-1), @0]),
        AASeriesElement.new
        .nameSet(@"2019")
        .dataSet(@[@0, @2.3, @0, @1.2, @(-1), @3, @0, @(-3.3), @0, @2, @(-0.3), @0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@0, @10, @0.13,@2,@0, @2, @0, @3.7, @0, @1, @(-3), @0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@0, @(-4.5), @(-0.9), @5.5, @(-1.9), @1.3, @(-2.8), @0, @(-1.7), @0, @3, @0, ]),
    ]);
}

- (void)doneButtonClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
