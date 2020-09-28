//
//  LineChartViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/25.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "LineChartViewController.h"

@interface LineChartViewController ()

@property (strong, nonatomic) AAChartView *aaChartView;

@end

@implementation LineChartViewController

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
        make.height.mas_equalTo(self.view).multipliedBy(0.6);
        
    }];
    
    [_aaChartView aa_drawChartWithChartModel:[self configure_chart]];
    
}

- (AAChartModel *)configure_chart {
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .tooltipValueSuffixSet(@"Points")
    .yAxisTitleSet(@"Points")
    .categoriesSet(@[
        @"Round 1", @"Round 2", @"Round 3", @"Round 4", @"Round 5", @"Round 6"
                   ])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Josh")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5]),
        AASeriesElement.new
        .nameSet(@"Emily")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0]),
        AASeriesElement.new
        .nameSet(@"John")
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0]),
        AASeriesElement.new
        .nameSet(@"Steven")        
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2]),
    ]);
}

#pragma mark - Button Clicked -

- (void)doneButtonClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
