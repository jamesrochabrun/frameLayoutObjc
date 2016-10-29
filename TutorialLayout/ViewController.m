//
//  ViewController.m
//  TutorialLayout
//
//  Created by James Rochabrun on 10/28/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _redView = [UIView new];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    _greenView = [UIView new];
    _greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greenView];
    
    _yellowView = [UIView new];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_yellowView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
        //you can decide the space between UI elements and make it consistent using just one variable, that let you change it in just one place and change it for all your views.
    CGFloat innerSpace = 20;
    CGFloat mainViewHeight = self.view.frame.size.height;
    CGFloat mainViewWidth = self.view.frame.size.width;
    //the block will be the 40% of the views height, you can adjust it at any time!
    CGFloat subViewHeight = mainViewHeight * 0.4;
    //the block will be the 80 % of the whole vie, you can adjust it at any time.
    CGFloat subViewWidth = mainViewWidth * 0.8;
    
    //This view will be your starting reference, always start thinking like that.
    CGRect frame = _redView.frame;
    frame.size.height = subViewHeight;
    frame.size.width = subViewWidth;
    frame.origin.x  = (mainViewWidth - frame.size.width) /2;
    //What it's going on here? ...
    //1 get the height of two blocks plus the height of the innerspace
    //2 substract it to the whole height and dividing it by 2
    //3 finally don't forget to add the value of the maxY that you substract at the beginig, that will give you a Y coordinate that will center your views!
    frame.origin.y = (mainViewHeight - (subViewHeight * 2 + innerSpace)) / 2;
    _redView.frame = frame;
    
    //Whats going on here? we are changing the width of the block, now we want less wider blocks so what to do? in this case you just want two so..
    //1 take the width of the view that you used as a starting reference
    //2 substract the amount of spacing
    // divide it by 2 (or more if you have more views)
    subViewWidth = (_redView.frame.size.width - innerSpace) /2;
    frame = _yellowView.frame;
    frame.size.width = subViewWidth;
    frame.size.height = subViewHeight;
    frame.origin.x = CGRectGetMinX(_redView.frame);
    frame.origin.y = CGRectGetMaxY(_redView.frame) + innerSpace;
    _yellowView.frame = frame;
    
    frame = _greenView.frame;
    frame.size.width = subViewWidth;
    frame.size.height = subViewHeight;
    frame.origin.x = CGRectGetMaxX(_yellowView.frame) + innerSpace;
    frame.origin.y = CGRectGetMaxY(_redView.frame) + innerSpace;
    _greenView.frame = frame;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
