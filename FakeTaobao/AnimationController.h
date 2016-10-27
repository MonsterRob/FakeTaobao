//
//  AnimationController.h
//  FakeTaobao
//
//  Created by 王召洲 on 2016/10/27.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,AnimationType){
    AnimationTypePresent,
    AnimationTypeDismiss
};
@interface AnimationController : NSObject<UIViewControllerAnimatedTransitioning>
+(instancetype)animationControllerWithType:(AnimationType)type;

@end
