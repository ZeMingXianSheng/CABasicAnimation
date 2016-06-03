
//
//  AnimationViewController.m
//  CirleProgressViewDemo
//
//  Created by Rain on 16/6/3.
//  Copyright © 2016年 Rain. All rights reserved.
//

#import "AnimationViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface AnimationViewController ()
@property (nonatomic, strong) UIImageView *cartCenter;
@property (nonatomic, strong) UIImageView *centerShow;
@end

@implementation AnimationViewController
- (UIImageView *)cartCenter {
    if (!_cartCenter) {
        _cartCenter = [[UIImageView alloc] init];
        _cartCenter.frame = CGRectMake(80, CGRectGetMaxY(_centerShow.frame) + 5, kScreenWidth - 80 * 2, 100);
        _cartCenter.backgroundColor = [UIColor colorWithRed:228.0 / 255 green:93.0 / 255 blue:110.0 / 255 alpha:1.0];
        _cartCenter.image = [UIImage imageNamed:@"right_mid_default"];
    }
    return _cartCenter;
}
- (void)theParameterInfo {
    //1.动画开始标记
    /**
     *  第一个参数:动画标识
     第二个参数: 附加参数, 在设置了代理的情况下, 此参数将发送到setAnimationWillStartSelector和setAnimationDidStopSelector所指定的方法. 大部分情况下, 我们设置为nil即可
     */
    [UIView beginAnimations:@"Animation" context:nil];
    //2.结束动画标记
    [UIView commitAnimations];
    
    /**
     *动画参数的设置方法
     */
    //1.动画持续时间
    [UIView setAnimationDuration:2];
    //2.动画的代理对象
    [UIView setAnimationDelegate:self];
    //3.设置动画将开始时代理对象执行的SEL
    [UIView setAnimationWillStartSelector:@selector(handleAnimationStart:)];
    //4.设置动画结束时代理对象执行的SEL
    [UIView setAnimationDidStopSelector:@selector(handleAnimationStop)];
    //5.设置动画延迟执行的时间
    [UIView setAnimationDelay:1];
    //6.设置动画的重读次数
    [UIView setAnimationRepeatCount:2];
    //.设置动画的曲线
    /**
     *  UIViewAnimationCurveEaseInOut --- 慢进慢出(默认)
     UIViewAnimationCurveEaseIn --- 慢进
     UIViewAnimationEaseOut --- 慢出
     UIViewAnimationCurveLinear --- 匀速
     */
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //7.设置是否从当前状态开始播放动画
    [UIView setAnimationBeginsFromCurrentState:YES];
    /**
     *  假设上一个动画正在播放, 且尚未播放完毕, 我们将要进行一个新的动画:
     当为YES时: 动画将从上一个动画所在的状态开始播放
     当为NO时 : 动画将从上一个动画所指定的最终状态开始播放(此时上一个动画马上结束)
     */
    //8.设置动画是否继续执行相反的动画
    [UIView setAnimationRepeatAutoreverses:YES];
    //9.是否禁用动画效果(对象属性依然会被改变, 只是没有动画效果)
    [UIView setAnimationsEnabled:NO];
    //10.设置视图的过渡效果
    /**
     *  第一个参数: UIViewAnimationTransition的枚举值如下:
     UIViewAnimationTransitionNone --- 不使用动画
     UIViewAnimationTransitionFilpFromLeft --- 从左向右旋转翻页
     UIViewAnimationTransitionFilpFromRight --- 从右向左选装翻页
     UIViewAnimationTransitionCurUp --- 从下往上卷曲翻页
     UIViewAnimationTransitionCurDowm --- 从上往下卷曲翻页
     第二个参数: 需要过渡效果的View
     第三个参数: 是否使用视图缓存, YES:视图在开始和结束时渲染一次; NO:视图在每一帧都渲染
     */
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    /**
     *  UIViewAnimationOptions的枚举值如下, 可组合使用:
     UIViewAnimationOptionLayoutSubViews -- 进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction -- 进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState -- 从当前状态开始动画
     UIViewAnimationOptionRepeat -- 无限重复执行动画
     UIViewAnimationOptionAutoreverse -- 执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration -- 忽略嵌套动画的执行时间的设置
     UIViewAnimationOptionOverrideInheritedCurve -- 忽略嵌套动画的曲线设置
     UIViewAnimationOptionAllowAnimatedContent -- 转场: 进行动画时重绘视图
     UIViewAnimationOverrideInheritedOptions -- 不继承父动画设置
     
     UIViewAnimationOptionCurveEaseInOut -- 时间曲线, 慢进慢出(默认值)
     UIViewAnimationOptionCurveEaseIn -- 时间曲线, 慢进
     UIViewAnimationOptionCurveEaseOut -- 时间曲线, 慢出
     UIViewAnimationOptionCurveLinear -- 时间曲线, 匀速
     
     UIViewAnimationOptionTransitionNone -- 转场, 不使用动画
     UIViewAnimationOptionTransitionFlipFromLeft -- 转场, 从左向右旋转翻页
     UIViewAnimationOptionTransitionFilpFromRigth -- 转场, 从右向左旋转翻页
     UIViewAnimationOptionTransitionCurUp -- 转场, 下往上卷曲翻页
     UIViewAnimationOptionTransitionCurDown -- 转场, 上往下卷曲翻页
     UIViewAnimationOptionTransitionCrossDissolve -- 转场, 交叉消失和出现
     UIViewAnimationOptionTransitionFilpFromTop -- 转场, 从上向下旋转翻页
     UIViewAnimationOptionTransitionFilpFromBottom -- 转场, 从下向上旋转翻页.
     */

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.centerShow = [[UIImageView alloc] init];
    
    _centerShow.frame = CGRectMake(100, 100, kScreenWidth - 200, 80);
    _centerShow.backgroundColor = [UIColor colorWithRed:134.0 / 255 green:117.0 / 255 blue:183.0 / 255 alpha:1.0];
    _centerShow.image = [UIImage imageNamed:@"right_mid_default"];
    [self.view addSubview:_centerShow];
    [self.view addSubview:self.cartCenter];
}

/**
 *  修改frame
 */
- (void)changeFrame {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.cartCenter.frame = self.centerShow.frame;
    [UIView commitAnimations];
}
/**
 *  转场效果动画(以Filp效果为例)
 */
- (void)filpAni {
    [UIView beginAnimations:@"FlipAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    
    self.centerShow.image = [UIImage imageNamed:@"per0.jpg"];
    [UIView commitAnimations];
}
- (void)startAni:(NSString *)aniId {
    NSLog(@"%@ start", aniId);
}
- (void)stopAni:(NSString *)aniID {
    NSLog(@"%@ stop", aniID);
}
/**
 *  blcok动画
 */
- (void)blockAni {
    //1.延迟动画block
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.cartCenter.frame = self.centerShow.frame;
    } completion:^(BOOL finished) {
        
    }];
}
/**
 *  Spring动画 ios7.0
 */
- (void)springAni {
    //usingSpringWithDamping: 震动效果, 范围0~1, 数值越小震动效果越明显
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        self.cartCenter.frame = self.centerShow.frame;
    } completion:^(BOOL finished) {
        
    }];
}
/**
 *  Keyframes 动画
    iOS7.0新增关键帧动画, 支持属性关键帧, 不支持路径关键帧
 */
- (void)keyframeAni  {
    [UIView animateKeyframesWithDuration:9 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        //增加关键帧的方法
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.9475 green:0.1921 blue:0.1746 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.6475 green:0.4921 blue:0.1746 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:2.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.5475 green:0.921 blue:0.1746 alpha:1.0];
        }];
//        self.cartCenter.frame = self.centerShow.frame;
    } completion:^(BOOL finished) {
        
    }];
    
}
/**
 *  转场
    在该动画过程中, fromView会从父视图中移除, 并将toView添加到父视图中, 注意转场动画的作用对象是父视图(过渡效果体现是在父视图上).
    调用该方法相当于执行下面两句代码
    [fromView.superView addSubView:toView];
    [fromView removeFromView];
 */
- (void)trasitonAni {
    [UIView transitionFromView:self.centerShow toView:self.cartCenter duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        
    }];
}
/**
 *  单个视图的转场动画
 */
- (void)onlyTransitionBlockAni {
    [UIView transitionWithView:self.centerShow duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.centerShow.image = [UIImage imageNamed:@"wrong_mid_default"];
    } completion:^(BOOL finished) {
        self.centerShow.image = [UIImage imageNamed:@"right_mid_default"];
    }];
}

/**
 *  CABasicAnimation
    CABasicAnimation可以设定keyPath的起点, 终点的值, 动画会沿着设定点进行移动, CABasicAnimation 可以看成是只有两个关键点的特殊的CAKeyFrameAnimation
 */
- (void)positonAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.toValue = [NSValue valueWithCGPoint:self.centerShow.center];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.cartCenter.layer addAnimation:ani forKey:@"positionAni"];
}
/**
 *  x
 */
- (void)positionXAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    ani.fromValue = [NSValue valueWithCGPoint:_cartCenter.layer.position];
    ani.toValue = @(300);
    ani.removedOnCompletion = NO;
    ani.duration = 1.2;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.cartCenter.layer addAnimation:ani forKey:@"positionXAni"];
}
/**
 * 缩放
 */
- (void)transitionScale {
    CABasicAnimation *scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAni.fromValue = @(1.0);
    scaleAni.toValue = @(2.5);
    scaleAni.removedOnCompletion = NO;
    scaleAni.autoreverses = YES;//动画结束时是否执行逆动画.
    scaleAni.fillMode = kCAFillModeForwards;
    scaleAni.repeatCount = 1;
    scaleAni.duration = 1.5;
    [self.cartCenter.layer addAnimation:scaleAni forKey:@"scaleAnimation"];
}
/**
 *  旋转
 */
- (void)scaleX {
    CABasicAnimation *rotationX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationX.toValue = @(3.0);
    rotationX.fillMode = kCAFillModeForwards;
    rotationX.repeatCount = 1;
    rotationX.duration = 1.5;
    rotationX.removedOnCompletion = NO;
    [self.cartCenter.layer addAnimation:rotationX forKey:@"scaleXAni"];
}
/**
 *  bounds
 */
- (void)boundsPath {
    CABasicAnimation *boundX = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundX.fromValue    = [NSValue valueWithCGRect:_centerShow.bounds];
    boundX.toValue      = [NSValue valueWithCGRect:CGRectMake(10,10,200,200)];
//    boundX.toValue = @(200);
    boundX.fillMode = kCAFillModeForwards;
    boundX.duration = 1.2;
    boundX.removedOnCompletion = NO;
    [self.centerShow.layer addAnimation:boundX forKey:@"boundsXAni"];
}
/**
 *  translation平移
 */
- (void)translationPath {
    CABasicAnimation *translationAni = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    translationAni.toValue = @(100);
    translationAni.fillMode = kCAFillModeForwards;
    translationAni.duration = 1.2;
    translationAni.removedOnCompletion = NO;
    [self.centerShow.layer addAnimation:translationAni forKey:@"translationAni"];
}



/**
 *  CAAnimationGroup动画组合
 */
- (void)groupAni {
    CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    ani1.toValue = [NSValue valueWithCGPoint:CGPointMake(100, -120)];
//    ani1.toValue = @(- 100);
    
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    ani2.fromValue = @(0.0);
    ani2.toValue = @(M_PI);
    
    CABasicAnimation *ani3 = [CABasicAnimation animationWithKeyPath:@"bounds"];
    ani3.fromValue = [NSValue valueWithCGRect:_cartCenter.bounds];
    ani3.toValue = [NSValue valueWithCGRect:CGRectMake(200, 0, 100, 50)];
    
    //动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2;
    group.repeatCount = 1;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.animations = @[ani1, ani2, ani3];
    [self.cartCenter.layer addAnimation:group forKey:@"groupAni"];
}
/**
 *  opcaity
 */
- (void)opacityAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"opacity"];
    ani.duration = 1.5;
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    ani.toValue = @(0.0);
    [self.cartCenter.layer addAnimation:ani forKey:@"opacity"];
}
/**
 *  cornerRadius
 */
- (void)cornerRadiusAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    ani.duration = 1.5;
    ani.toValue = @(30);
    [self.cartCenter.layer addAnimation:ani forKey:@"cornerRadiusAni"];
}
/**
 * contents
 */
- (void)contentsAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"contents"];
    ani.fillMode = kCAFillModeForwards;
    ani.duration = 1.2;
    ani.removedOnCompletion = NO;
    ani.toValue = (id)[UIImage imageNamed:@"wrong_mid_default"].CGImage;
    [self.cartCenter.layer addAnimation:ani forKey:@"contentsAni"];
}
/**
 * shadowColor
 */
- (void)shadowColorAni {
    self.cartCenter.layer.shadowOpacity = 1.0;
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    ani.toValue = (id)[UIColor greenColor].CGColor;
    ani.removedOnCompletion = NO;
    ani.duration = 1.2;
    ani.fillMode = kCAFillModeForwards;
    [self.cartCenter.layer addAnimation:ani forKey:@"shadowColorAni"];
    
}
/**
 * shadowOffset
 */
- (void)shadowOffset {
    _cartCenter.layer.shadowOpacity = 1.0;
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    ani2.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    ani2.toValue = [NSValue valueWithCGSize:CGSizeMake(3, 3)];
    ani2.removedOnCompletion = NO;
    ani2.fillMode = kCAFillModeForwards;
    ani2.duration = 1.5;
    ani2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.cartCenter.layer addAnimation:ani2 forKey:@"shadowOffsetAni"];
}
/**
 *  borderWidth
 */
- (void)borderWidthAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    ani.toValue = @(3);
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    ani2.toValue = (id)[UIColor greenColor].CGColor;
    CABasicAnimation *ani3 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    ani3.toValue = @(50);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.duration = 1.5;
    group.animations = @[ani, ani2, ani3];
    
    [self.cartCenter.layer addAnimation:group forKey:@"borderWidthAni"];
}
/**
 * shadowRadius
 */
- (void)shadowRadius {
    _cartCenter.layer.shadowOpacity = 1.0;
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    ani2.toValue = @(5);
    ani2.removedOnCompletion = NO;
    ani2.fillMode = kCAFillModeForwards;
    ani2.duration = 1.5;
    ani2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.cartCenter.layer addAnimation:ani2 forKey:@"shadowRadiusAni"];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self shadowRadius];
}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
