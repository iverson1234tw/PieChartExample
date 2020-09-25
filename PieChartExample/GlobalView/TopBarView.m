//
//  TopBarView.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/24.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "TopBarView.h"

@implementation TopBarView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initTopBar];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).offset(10);
        
    }];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self).offset(10);
        make.centerY.mas_equalTo(_titleLabel);
        
    }];
    
    [_additionButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(self).offset(-15);
        make.centerY.mas_equalTo(_titleLabel);
        make.width.height.mas_equalTo(30);
        
    }];
    
}

- (void)initTopBar {
    
    self.backgroundColor = WANG_DA_XI_BLUE;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    _titleLabel = titleLabel;
    
    [self addSubview:_titleLabel];
    
    UIButton *backButton = [[UIButton alloc] init];
    [backButton setTitle:@"Done" forState:UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont fontWithName:AGENCY_FB size:15]];
    _backButton = backButton;
    
    [self addSubview:_backButton];
    
    UIButton *additionButton = [[UIButton alloc] init];
    additionButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    additionButton.adjustsImageWhenHighlighted = NO;
    _additionButton = additionButton;
    
    [self addSubview:_additionButton];
    
}

@end
