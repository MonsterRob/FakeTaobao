//
//  DetailPage.m
//  FakeTaobao
//
//  Created by 王召洲 on 2016/10/27.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "DetailPage.h"
#import "AnimationController.h"

@interface DetailPage ()<UIViewControllerTransitioningDelegate>

@end

@implementation DetailPage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.view.alpha = 0.2;
    
}
// 本控制器入场时调用
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [AnimationController animationControllerWithType:AnimationTypePresent];
    
}
// 本控制器出场时调用
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [AnimationController animationControllerWithType:AnimationTypeDismiss];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
