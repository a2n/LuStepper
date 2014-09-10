//
//  Stepper.h
//  DuobaoStepper
//
//  Created by Alan Lu on 9/10/14.
//  Copyright (c) 2014 Duobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuStepper : UIView <UITextFieldDelegate> {
    UIButton * minusButton;
    UIButton * plusButton;
    CATextLayer * timesTextLayer;
    NSInteger _value;
    
    // Gesture
    UIColor * originalColor;
    CGPoint pointDelta;
}
@property NSInteger value;
@end