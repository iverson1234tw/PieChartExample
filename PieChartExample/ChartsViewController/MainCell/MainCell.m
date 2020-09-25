//
//  MainCell.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/24.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initialize];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(50);
        
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.centerY.mas_equalTo(_backView);
        
    }];
    
}

- (void)initialize {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _backView = [[UIView alloc] init];
    _backView.layer.cornerRadius = 2.5f;
    _backView.layer.masksToBounds = YES;
    _backView.backgroundColor = WANG_DA_XI_BLUE;
    
    [self.contentView addSubview:_backView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    _titleLabel.textColor = [UIColor whiteColor];
    
    [_backView addSubview:_titleLabel];
    
}

@end
