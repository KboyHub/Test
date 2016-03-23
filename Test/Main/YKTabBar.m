//
//  YKTabBar.m
//  Test
//
//  Created by 闫康 on 16/3/23.
//  Copyright © 2016年 yankang. All rights reserved.
//

#import "YKTabBar.h"
#import "UIView+Extension.h"
#import "ReactiveCocoa.h"

@interface  YKTabBar ()
@property (nonatomic,strong) UIButton *addButton;
@end

@implementation YKTabBar


-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        //设置tabbar的文字颜色
        UITabBarItem *appearance = [UITabBarItem appearance];
        [appearance setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName : [UIColor darkGrayColor]}
                                  forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [addButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [addButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        addButton.size = addButton.currentBackgroundImage.size;
        [[addButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            //
        }];
        
        self.addButton = addButton;
        [self addSubview:_addButton];
        
    }
    return self;
}

//重新设置按钮的位置
-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    NSInteger index = 0;
    CGFloat btnW = width / 5;
    CGFloat btnH = height;
    CGFloat btnY = 0;
    
    //发布按钮位置
    self.addButton.center = CGPointMake(width/2, height/2);
    //遍历取出按钮
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]] || view == self.addButton) continue; {
            
            CGFloat btnX = (index > 1 ? (index +1) : index) *btnW;
            
            view.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index++;
        }
    }
    
}




@end
