//
//  LeftViewController.h
//  DiDiSideViewDemo
//
//  Created by 孔友夫 on 2017/12/12.
//  Copyright © 2017年 LV. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol leftviewDelegate

@optional
-(void)openleftside:(NSInteger)index;

@end


@interface LeftViewController : UIViewController



@property (nonatomic,weak)id<leftviewDelegate>delegate;


@end
