//
//  CircleProgressView.m
//  CirleProgressViewDemo
//
//  Created by Rain on 16/6/2.
//  Copyright © 2016年 Rain. All rights reserved.
//

#import "CircleProgressView.h"
#import "CircleProgressLayer.h"

@interface CircleProgressView ()
@property (nonatomic, strong) CircleProgressLayer *circleProgressLayer;
@property (nonatomic, strong) UILabel *progressLabel;
@end
@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.circleProgressLayer = [CircleProgressLayer layer];
        self.circleProgressLayer.frame = self.bounds;
        //像素大小比例
        self.circleProgressLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleProgressLayer];
        
        self.progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.progressLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.font = [UIFont systemFontOfSize:30];
        _progressLabel.text = @"%";
        [self addSubview:self.progressLabel];
    }
    return self;
}
- (void)setProgress:(CGFloat)progress {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"progress"];
    ani.duration = 5.0 * fabs(progress - _progress);
    ani.toValue = @(progress);
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.delegate = self;
    [self.circleProgressLayer addAnimation:ani forKey:@"progressAni"];
    
    self.progressLabel.text = [NSString stringWithFormat:@"%0.f", progress * 100];
    _progress = progress;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.circleProgressLayer.progress = self.progress;
}










































/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
