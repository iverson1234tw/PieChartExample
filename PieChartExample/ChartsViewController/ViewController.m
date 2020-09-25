//
//  ViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/24.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "PieChartViewController.h"
#import "LineChartViewController.h"
#import "ColumChartViewController.h"
#import "BarChartViewController.h"
#import "AreaChartViewController.h"
#import "ViewController.h"
#import "MainCell.h"

#define TitleList @[@"Colum Chart", @"Line Chart", @"Pie Chart", @"Bar Chart", @"Area Chart"]

typedef enum {
    TableList, // 表單
    GridList   // 格子
} ListStyle;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    TopBarView *topBar;
    MainCell *mainCell;
    ListStyle style;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self init_main_view];
    
}

#pragma mark - MainView init -

- (void)init_main_view {
    
    topBar = [[TopBarView alloc] initWithFrame:CGRectZero];
    topBar.titleLabel.text = @"Charts Demo";
    topBar.additionButton.hidden = true;
    topBar.backButton.hidden = true;
    
    [self.view addSubview:topBar];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 100;
    
    [self.view addSubview:tableView];
    
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@70);
        
    }];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(topBar.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
        
    }];
    
}

#pragma mark - Button Clicked -

- (void)additionButtonClicked:(UIButton *)sender {
    
    switch (style) {
        
        case GridList:
            
            style = TableList;
            
            [topBar.additionButton setImage:[UIImage imageNamed:@"activity_grid_2"] forState:UIControlStateNormal];
            
            break;
            
        case TableList:
            
            style = GridList;
            
            [topBar.additionButton setImage:[UIImage imageNamed:@"align_justify"] forState:UIControlStateNormal];
            
            break;
                    
    }
    
}

#pragma mark - UITableViewDelegate && DataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [TitleList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld", (long)indexPath.row];
    
    mainCell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    mainCell = (MainCell *)mainCell;
    
    mainCell.titleLabel.text = [TitleList objectAtIndex:indexPath.row];
    
    [mainCell layoutIfNeeded];

    return mainCell;
}

#pragma mark - UITableViewCell Did Selected -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        
        case 0: {
         
            ColumChartViewController *columViewController = [[ColumChartViewController alloc] init];
            columViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [self presentViewController:columViewController animated:YES completion:nil];
            
            break;
        }
            
        case 1: {
         
            LineChartViewController *lineViewController = [[LineChartViewController alloc] init];
            lineViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [self presentViewController:lineViewController animated:YES completion:nil];
            
            break;
        }
            
        case 2: {
            
            PieChartViewController *pieViewController = [[PieChartViewController alloc] init];
            pieViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [self presentViewController:pieViewController animated:YES completion:nil];
            
            break;
        }
            
        case 3: {
            
            BarChartViewController *barViewController = [[BarChartViewController alloc] init];
            barViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [self presentViewController:barViewController animated:YES completion:nil];
            
            break;
        }
            
        case 4: {
            
            AreaChartViewController *areaViewController = [[AreaChartViewController alloc] init];
            areaViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [self presentViewController:areaViewController animated:YES completion:nil];
            
            break;
        }
            
    }
    
}

@end
