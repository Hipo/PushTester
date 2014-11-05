//
//  ViewController.h
//  PushTester
//
//  Created by Taylan Pince on 2014-11-05.
//  Copyright (c) 2014 Hipo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (nonatomic, strong, readonly) UITextView *tokenView;
@property (nonatomic, strong, readonly) UITextView *messageView;
@property (nonatomic, strong, readonly) UILabel *dateLabel;

@end
