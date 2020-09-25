//
//  ViewController.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/24.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "ViewController.h"
#import "MainCell.h"

#define TitleList @[@"Colum Chart", @"Line Chart", @"Pie Chart"]

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
    topBar.titleLabel.text = @"PieChart Example";
    topBar.backButton.hidden = true;
    [topBar.additionButton setImage:[UIImage imageNamed:@"activity_grid_2"] forState:UIControlStateNormal];
    [topBar.additionButton addTarget:self action:@selector(additionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
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
        make.height.mas_equalTo(self.view).multipliedBy(0.1);
        
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
    
    switch (indexPath.row) {
        
        case 0:
            
            break;
            
        case 1:
            
            break;
            
        case 2:
            
            break;
            
    }
    
}

@end
