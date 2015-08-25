//
//  TimeLineCollectionViewCell.m
//  TimeLineAblum
//
//  Created by weiwei on 15/8/25.
//  Copyright (c) 2015年 weiwei. All rights reserved.
//

#import "TimeLineCollectionViewCell.h"

@interface TimeLineCollectionViewCell ()

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *yearLabel;

@end

@implementation TimeLineCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;

    CGFloat top = 20;
    _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, top, width-2*10-5, 20)];
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_dayLabel];
    
    _yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, top+20, width-2*10-5, 20)];
    _yearLabel.textAlignment = NSTextAlignmentCenter;
    _yearLabel.font = [UIFont systemFontOfSize:13.0f];
    [self addSubview:_yearLabel];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(20, top+19, width-2*20-5, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1];
    [self addSubview:line];
    
    UILabel *vline = [[UILabel alloc] initWithFrame:CGRectMake(width-15, 0, 0.5, height)];
    vline.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1];
    [self addSubview:vline];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:self.timeString];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    comps = [calendar components:unitFlags fromDate:date];
    
    NSInteger year=[ comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    _dayLabel.text = [NSString stringWithFormat:@"%zd日",day];
    _yearLabel.text = [NSString stringWithFormat:@"%zd.%zd",year,month];

}


@end
