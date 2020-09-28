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
    .yAxisVisibleSet(false)
    .chartTypeSet(AAChartTypeSpline)
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .markerRadiusSet(@1.0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Points")
        .lineWidthSet(@1.0)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        .shadowSet(AAShadow.new
                   .offsetXSet(@1.0)
                   .offsetYSet(@1.0)
                   .opacitySet(@0.2)
                   .widthSet(@1.0)
                   .colorSet(AAColor.redColor)
                   ),
               ]);
}

- (void)doneButtonClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
