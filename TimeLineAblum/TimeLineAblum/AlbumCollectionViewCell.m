//
//  AlbumCollectionViewCell.m
//  TimeLineAblum
//
//  Created by weiwei on 15/8/25.
//  Copyright (c) 2015年 weiwei. All rights reserved.
//

#import "AlbumCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface AlbumCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AlbumCollectionViewCell

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
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_imageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSString *url = [NSString stringWithFormat:@"http://192.168.1.183/images/thumb_IMG_%@_1024.jpg",self.imageName];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:url]];
}



@end
