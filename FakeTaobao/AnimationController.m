//
//  AnimationController.m
//  FakeTaobao
//
//  Created by 王召洲 on 2016/10/27.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "AnimationController.h"
#import "UIView+TT.h"
@interface AnimationController ()
{
    AnimationType _type;
}
@end
@implementation AnimationController

-(instancetype)initWithAnimationType:(AnimationType)type {
    
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}
+(instancetype)animationControllerWithType:(AnimationType)type {
    
    return [[self alloc]initWithAnimationType:type];
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return _type == AnimationTypePresent ? 8:8;
    
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    switch (_type) {
        case AnimationTypePresent:
            [self animationForPresnetWithContext:transitionContext];
            break;
        case AnimationTypeDismiss:
            [self animationForDismissWithContext:transitionContext];
            break;
            
        default:
            break;
    }
}
-(void)animationForPresnetWithContext:(id<UIViewControllerContextTransitioning>)context {
    UIViewController *fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [context viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contentView = [context containerView];
    
    CGFloat H = contentView.bounds.size.height;
    CGFloat W = contentView.bounds.size.width;
    
    UIView *snapView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    snapView.tag = 10;
    snapView.layer.anchorPoint = CGPointMake(0.5, 1);
    snapView.frame = fromVC.view.frame;
    fromVC.view.hidden = YES;
    
    toVC.view.frame = CGRectMake(0, H, W, H*0.7);
    
    [contentView addSubview:snapView];
    [contentView addSubview:toVC.view];
    
    NSTimeInterval interval = [self transitionDuration:context];
    
    CATransform3D trans = CATransform3DMakeRotation(2*M_PI/180, 1, 0, 0);
    CATransform3D combineTrans = CATransform3DPerspect(trans,CGPointMake(0, 0),400);
    
    [UIView animateWithDuration:interval*0.4 animations:^{
        snapView.layer.transform = combineTrans;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:interval*0.6 animations:^{
            snapView.transform = CGAffineTransformMakeScale(0.78, 0.96);
            toVC.view.frame = CGRectMake(0, 0.3*H, W, 0.7*H);
        } completion:^(BOOL finished) {
            [context completeTransition:YES];
        }];
    }];
    
    
    
    
    
}
-(void)animationForDismissWithContext:(id<UIViewControllerContextTransitioning>)context {
    
    UIViewController *fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [context viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contentView = [context containerView];
    CGFloat H = contentView.bounds.size.height;
    CGFloat W = contentView.bounds.size.width;
    
    UIView *snapView = [contentView viewWithTag:10];
    NSTimeInterval interval = [self transitionDuration:context];
    
    

    CATransform3D trans = CATransform3DMakeRotation(2*M_PI/180, 1, 0, 0);
    CATransform3D combineTrans = CATransform3DPerspect(trans,CGPointMake(0, 0),400);
    
    [UIView animateWithDuration:interval/2 animations:^{
        
        fromVC.view.frame = CGRectMake(0, H, W, H*0.7);
        snapView.layer.transform = combineTrans;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:interval/2 animations:^{
            
            snapView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            [context completeTransition:YES];
            toVC.view.hidden = NO;
            [snapView removeFromSuperview];
        }];
        
       

    }];
    
    
    

}
@end
