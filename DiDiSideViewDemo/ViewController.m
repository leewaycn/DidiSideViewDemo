//
//  ViewController.m
//  DiDiSideViewDemo
//
//  Created by 孔友夫 on 2017/12/12.
//  Copyright © 2017年 LV. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "MiddleViewController.h"

#import "leftDetailViewController.h"


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<leftviewDelegate>


@property (nonatomic,strong)LeftViewController *leftView;
@property (nonatomic,strong)MiddleViewController *middleView;
@property (nonatomic,strong)UIView *maskView;


@end

@implementation ViewController

-(LeftViewController *)leftView{
    if (!_leftView) {
        _leftView = [[LeftViewController alloc]init];
        _leftView.delegate = self;
    }
    return _leftView;
}
-(void)openleftside:(NSInteger)index{

        leftDetailViewController *detail  = [[leftDetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    
}
-(MiddleViewController*)middleView{
    if (!_middleView) {
        _middleView = [[MiddleViewController alloc]init];
    }
    return _middleView;
}
-(UIView*)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc]init];
        _maskView.backgroundColor = [UIColor lightGrayColor];
        _maskView.alpha  = 0.5;
        _maskView.userInteractionEnabled =YES;
        [_maskView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideleftview)]];
    }
    return _maskView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController:self.middleView];
    [self addChildViewController:self.leftView];
    [self.view addSubview:self.middleView.view];

    [self.view addSubview:self.maskView];

    [self.view addSubview:self.leftView.view];

    self.leftView.view.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth-100, ScreenHeight);

    self.maskView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);

    self.maskView.hidden = YES;
    self.middleView.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);



    //设置一个按钮点击实现抽屉效果
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton.frame = CGRectMake(0, 50, 150, 150);
    [leftButton addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"left" forState:UIControlStateNormal];
    [self.middleView.view addSubview:leftButton];






}


-(void)leftButtonPressed
{
    //判断抽屉是否是展开状态
    if (self.leftView.view.frame.origin.x != 0) {

        //通过动画实现view.fram的改变
        [UIView animateWithDuration:0.3 animations:^{
            /*  W  H  屏幕实际大小宏
             * #define ScreenWidth [UIScreen mainScreen].bounds.size.width
             * #define ScreenHeight [UIScreen mainScreen].bounds.size.height
             */
            self.leftView.view.frame = CGRectMake(0, 0, ScreenWidth-100, ScreenHeight);

        } completion:^(BOOL finished) {


            self.maskView.hidden = NO;

        }];

    }else{

        [UIView animateWithDuration:0.3 animations:^{

            self.leftView.view.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth-100, ScreenHeight);

        } completion:^(BOOL finished) {
            self.maskView.hidden = YES;
        }];
    }
}
-(void)hideleftview{

    [UIView animateWithDuration:0.3 animations:^{

        self.leftView.view.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth-100, ScreenHeight);

    } completion:^(BOOL finished) {
        self.maskView.hidden = YES;
    }];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
