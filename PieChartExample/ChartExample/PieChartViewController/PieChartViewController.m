//
//  PieChartViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/25.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "PieChartViewController.h"

@interface PieChartViewController ()

@property (strong, nonatomic) AAChartView *aaChartView;

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self init_main_view];
    
}

- (void)init_main_view {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TopBarView *topBar = [[TopBarView alloc] initWithFrame:CGRectZero];
    topBar.titleLabel.text = @"Pie Chart";
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
        
        make.top.mas_equalTo(topBar.mas_bottom);
        make.left.bottom.right.mas_equalTo(self.view);
        
    }];
    
    [_aaChartView aa_drawChartWithChartModel:[self configure_chart]];
    
}

- (AAChartModel *)configure_chart {
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"Apple Devices")
    .subtitleSet(@"")
    .dataLabelsEnabledSet(true)
    .dataLabelsFontSizeSet(@8)
    .dataLabelsFontWeightSet(@"Light")
    .yAxisTitleSet(@"Heat")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Devices")
        .sizeSet((id)@"60%")
        .innerSizeSet(@"0%")
        .borderWidthSet(@0)
        .allowPointSelectSet(true)
        .dataSet(@[
            @[@"iPhone 6S",   @3336.2],
            @[@"iPhone 8Plus",      @26.8],
            @[@"iPhone SE",      @88.5],
            @[@"iPhone XS",       @46.0],
            @[@"iPhone XS Max",     @223.0],
        ]),
    ]);
}

#pragma mark - Button Clicked -

- (void)doneButtonClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
