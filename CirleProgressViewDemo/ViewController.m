//
//  ViewController.m
//  CirleProgressViewDemo
//
//  Created by Rain on 16/6/2.
//  Copyright © 2016年 Rain. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"


#import "AnimationViewController.h"
@interface ViewController ()
@property (nonatomic, strong) CircleProgressView *circleProgressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.circleProgressView = [[CircleProgressView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) / 2, 100, 100, 100)];
    self.circleProgressView.progress = 0.2;
    [self.view addSubview:self.circleProgressView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 400, 275, 10)];
    [slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    slider.maximumValue = 1.0;
    slider.minimumValue = 0.f;
    slider.value = self.circleProgressView.progress;
    [self.view addSubview:slider];
}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.circleProgressView.progress += (arc4random() % 4 + 1) * 0.1;
//    [self.circleProgressView setNeedsDisplay];
//}

- (void)changeProgress:(UISlider *)slider {
    self.circleProgressView.progress = slider.value;
    [self.circleProgressView setNeedsDisplay];
}


- (IBAction)handleNextAction:(UIBarButtonItem *)sender {
    AnimationViewController *aniVC = [AnimationViewController new];
    [self.navigationController pushViewController:aniVC animated:YES];
    
}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
