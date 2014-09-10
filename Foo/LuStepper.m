//
//  Stepper.m
//  DuobaoStepper
//
//  Created by Alan Lu on 9/10/14.
//  Copyright (c) 2014 Duobao. All rights reserved.
//

#import "LuStepper.h"

@implementation LuStepper

@synthesize value = _value;

#pragma mark - UIView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(frame.origin.x,
                                           frame.origin.y, 
                                           frame.size.width,
                                           44)];
    if (self) {
        [self build];
    }
    return self;
}

#pragma mark - Base
- (void)build {
    _value = 0;
    
    // Minus button
    minusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [minusButton setTitle:@"-" forState:UIControlStateNormal];
    [minusButton addTarget:self
                    action:@selector(minusDidTap:)
          forControlEvents:UIControlEventTouchUpInside];
    CGRect rect = CGRectMake(0, 0, 44, 44);
    [minusButton setFrame:rect];
    [self enlargeTitleSizeInButton:minusButton];
    [self addSubview:minusButton];

    // Times text layer
    rect = CGRectMake(44, 0, self.frame.size.width - 88, 44);
    timesTextLayer = [CATextLayer layer];
    [timesTextLayer setFrame:rect];
    [timesTextLayer setContentsScale:[UIScreen mainScreen].scale];
    [timesTextLayer setForegroundColor:[UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1].CGColor];
    [timesTextLayer setBackgroundColor:[UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1].CGColor];
    [timesTextLayer setFont:CGFontCreateWithFontName((CFStringRef)@"HelveticaNeue-Light")];
    [timesTextLayer setAlignmentMode:kCAAlignmentCenter];
    [timesTextLayer setMasksToBounds:YES];
    [self.layer addSublayer:timesTextLayer];
    [self updateTimesTextLayer];
    
    // Plus button
    plusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    [plusButton addTarget:self
                   action:@selector(plusDidTap:)
         forControlEvents:UIControlEventTouchUpInside];
    rect = CGRectMake(self.frame.size.width - 44, 0, 44, 44);
    [plusButton setFrame:rect];
    [self enlargeTitleSizeInButton:plusButton];
    [self addSubview:plusButton];
    
    [self.layer setCornerRadius:5.0f];
    [self.layer setBorderWidth:0.7f];
    [self.layer setBorderColor:[UIColor grayColor].CGColor];
}

- (void)enlargeTitleSizeInButton:(UIButton *)button {
    UIFont * font = nil;
    CGRect rect = button.frame;
    for (CGFloat i = [UIFont buttonFontSize]; i < FLT_MAX; i++) {
        font = [UIFont systemFontOfSize:i];
        NSDictionary * attr = [NSDictionary dictionaryWithObject:font
                                                          forKey:NSFontAttributeName];
        CGSize size = [button.titleLabel.text sizeWithAttributes:attr];
        if (size.width > rect.size.width || size.height > rect.size.height) {
            break;
        }
    }
    [button.titleLabel setFont:font];
}

- (void)minusDidTap:(id)sender {
    _value--;
    NSLog(@"%s, %d", __FUNCTION__, _value);
    [self updateTimesTextLayer];
}

- (void)plusDidTap:(id)sender {
    _value++;
    NSLog(@"%s, %d", __FUNCTION__, _value);
    [self updateTimesTextLayer];
}

- (void)updateTimesTextLayer {
    [timesTextLayer setString:[NSString stringWithFormat:@"%d", _value]];
}
@end