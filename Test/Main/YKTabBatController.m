//
//  YKTabBatController.m
//  Test
//
//  Created by 闫康 on 16/3/23.
//  Copyright © 2016年 yankang. All rights reserved.
//

#import "YKTabBatController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "YKNavigationController.h"
#import "YKTabBar.h"

@interface YKTabBatController ()

@end

@implementation YKTabBatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialControllers];
    
    //替换系统tabbar
    [self setValue:[[YKTabBar alloc] init] forKeyPath:@"tabBar"];
    
}

//初始化子控制器
-(void)initialControllers {
    
    [self setupController:[[OneViewController alloc]init] image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"精华"];
    [self setupController:[[TwoViewController alloc]init] image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" title:@"最新"];
    [self setupController:[[ThreeViewController alloc]init] image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    [self setupController:[[FourViewController alloc]init] image:@"tabBar_me_icon"  selectedImage:@"tabBar_me_click_icon" title:@"我"];
}

//设置控制器
-(void)setupController:(UIViewController *)childVc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    UIViewController *viewVc = childVc;
    viewVc.tabBarItem.image = [UIImage imageNamed:image];
    viewVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    viewVc.tabBarItem.title = title;
    YKNavigationController *navi = [[YKNavigationController alloc]initWithRootViewController:viewVc];
    [self addChildViewController:navi];
    
}

/**
 *  初始化跟控制器 storyBoard 故事板
 */
//-(void)setupRootViewControllerWithStoryBoardName:(NSString *)storyBoardName Image:(NSString *)image selectImage: (NSString *)selectImage title:(NSString *)title;
//{
//    UIStoryboard *handPick=[UIStoryboard storyboardWithName: storyBoardName bundle:nil];
//    UIViewController *VC=handPick.instantiateInitialViewController;
//    
//    //
//    UIImage *simage = [UIImage imageNamed:image];
//    UIImage *sselectImage = [UIImage imageNamed:selectImage];
//    
//    simage = [simage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    sselectImage= [sselectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    VC.tabBarItem=[[UITabBarItem alloc]initWithTitle:title image: simage selectedImage:sselectImage];
//    
//    //设置字体颜色
//    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName]=rgb(137, 197, 40);
//    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
//    [self addChildViewController:VC];
//    
//}

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
