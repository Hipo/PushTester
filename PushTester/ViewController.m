//
//  ViewController.m
//  PushTester
//
//  Created by Taylan Pince on 2014-11-05.
//  Copyright (c) 2014 Hipo. All rights reserved.
//

#import "ViewController.h"

#import "PureLayout.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _messageView = [[UITextView alloc] initForAutoLayout];
    
    [_messageView setTextAlignment:NSTextAlignmentLeft];
    [_messageView setEditable:NO];
    [_messageView setSelectable:YES];
    [_messageView setAlwaysBounceVertical:YES];
    [_messageView setAlwaysBounceHorizontal:NO];
    [_messageView setFont:[UIFont systemFontOfSize:14.0]];
    [_messageView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.1]];
    
    [self.view addSubview:_messageView];
    
    [_messageView autoSetDimension:ALDimensionHeight toSize:100.0];
    [_messageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(60.0, 10.0, 0.0, 10.0)
                                           excludingEdge:ALEdgeBottom];
    
    _dateLabel = [[UILabel alloc] initForAutoLayout];
    
    [_dateLabel setTextAlignment:NSTextAlignmentRight];
    [_dateLabel setFont:[UIFont systemFontOfSize:11.0]];
    
    [self.view addSubview:_dateLabel];
    
    [_dateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_messageView withOffset:8.0];
    [_dateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15.0];
    [_dateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15.0];
    [_dateLabel autoSetDimension:ALDimensionHeight toSize:14.0];
    
    _tokenView = [[UITextView alloc] initForAutoLayout];
    
    [_tokenView setTextAlignment:NSTextAlignmentCenter];
    [_tokenView setEditable:NO];
    [_tokenView setSelectable:YES];
    [_tokenView setAlwaysBounceVertical:YES];
    [_tokenView setAlwaysBounceHorizontal:NO];
    [_tokenView setFont:[UIFont systemFontOfSize:14.0]];
    [_tokenView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.1]];
    
    [self.view addSubview:_tokenView];
    
    [_tokenView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_dateLabel withOffset:40.0];
    [_tokenView autoSetDimension:ALDimensionHeight toSize:60.0];
    [_tokenView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [_tokenView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
}

@end
