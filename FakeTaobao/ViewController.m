//
//  ViewController.m
//  FakeTaobao
//
//  Created by 王召洲 on 2016/10/27.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "DetailPage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)present:(UIButton *)sender {
    
    DetailPage *vc = [[DetailPage alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
