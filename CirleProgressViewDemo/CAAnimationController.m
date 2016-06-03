//
//  CAAnimationController.m
//  CirleProgressViewDemo
//
//  Created by Rain on 16/6/3.
//  Copyright © 2016年 Rain. All rights reserved.
//

#import "CAAnimationController.h"

@interface CAAnimationController ()
@property (nonatomic, strong) CAAnimation *caanimation;
@end

@implementation CAAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.caanimation = [CAAnimation animation];
    //动画的添加
    [self.view.layer addAnimation:_caanimation forKey:@"CAAnimationLayer"];
    //动画的移除
    [self.view.layer removeAnimationForKey:@"CAAnimationLayer"];
    [self.view.layer removeAllAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
