//
//  GridCell.m
//  PieChartExample
//
//  Created by iverson1234tw on 2020/9/24.
//  Copyright © 2020 josh.chen. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        
    }
    
    return self;
}

- (void)initialize {
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.cornerRadius = 2.5;
    _imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:12.0];
    
    [self.contentView addSubview:_titleLabel];
    
}

@end
