
//
//  leftDetailViewController.m
//  DiDiSideViewDemo
//
//  Created by 孔友夫 on 2017/12/12.
//  Copyright © 2017年 LV. All rights reserved.
//

#import "leftDetailViewController.h"

@interface leftDetailViewController ()

@end

@implementation leftDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];

    //设置一个按钮点击实现抽屉效果
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton.frame = CGRectMake(0, 50, 150, 150);
    [leftButton addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"pop" forState:UIControlStateNormal];
    [self.view addSubview:leftButton];



    
}
-(void)leftButtonPressed{
    [self.navigationController popViewControllerAnimated:YES];
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
