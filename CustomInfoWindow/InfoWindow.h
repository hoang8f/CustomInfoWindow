//
//  InfoWindow.h
//
//  Created by Le Van Hoang on 8/30/13.
//  Copyright (c) 2013 Custom InfoWindow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoWindow : UIView {
    UIImageView *background;
}
@property UIButton *direction;
@property UIButton *detail;
@property UILabel *title;
@property UILabel *snippet;

@end
