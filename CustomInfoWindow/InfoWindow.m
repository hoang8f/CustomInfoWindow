//
//  InfoWindow.m
//
//  Created by Le Van Hoang on 8/30/13.
//  Copyright (c) 2013 Custom InfoWindow. All rights reserved.
//

#import "InfoWindow.h"

@implementation InfoWindow

@synthesize title = _title;
@synthesize snippet = _snippet;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 269, 63)];
        [background setImage:[UIImage imageNamed:@"info_window.png"]];
        _direction = [[UIButton alloc] initWithFrame:CGRectMake(5, 1, 44, 44)];
        [_direction setImage:[UIImage imageNamed:@"direction.png"] forState:UIControlStateNormal];
        _detail = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 219, 46)];
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 180, 21)];
        _title.textColor = [UIColor whiteColor];
        _title.backgroundColor = [UIColor clearColor];
        _title.adjustsFontSizeToFitWidth = YES;
        [_title setFont:[UIFont systemFontOfSize:15]];
        
        _snippet = [[UILabel alloc] initWithFrame:CGRectMake(50, 21, 180, 21)];
        _snippet.textColor = [UIColor whiteColor];
        _snippet.backgroundColor = [UIColor clearColor];
        [_snippet setFont:[UIFont systemFontOfSize:12]];
        
        [self addSubview:background];
        [self addSubview:_direction];
        [self addSubview:_detail];
        [self addSubview:_title];
        [self addSubview:_snippet];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
