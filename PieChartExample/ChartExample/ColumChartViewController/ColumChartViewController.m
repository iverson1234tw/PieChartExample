//
//  ColumChartViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/25.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "ColumChartViewController.h"

@interface ColumChartViewController ()

@property (strong, nonatomic) AAChartView *aaChartView;

@end

@implementation ColumChartViewController

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
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .colorsThemeSet([self configureTheRandomColorArrayWithColorNumber:14])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ElementOne")
        .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
        .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
               ]);
}

- (NSArray *)configureTheRandomColorArrayWithColorNumber:(NSInteger)colorNumber {
    NSMutableArray *colorStringArr = [[NSMutableArray alloc]init];
    for (unsigned int i=0; i < colorNumber; i++) {
        unsigned int R = (arc4random() % 256) ;
        unsigned int G = (arc4random() % 256) ;
        unsigned int B = (arc4random() % 256) ;
        NSString *colorStr = [NSString stringWithFormat:@"rgba(%d,%d,%d,0.9)",R,G,B];
        [colorStringArr addObject:colorStr];
    }
    return colorStringArr;
}

#pragma mark - Button Clicked -

- (void)doneButtonClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
