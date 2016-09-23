//
//  UINavigationController+Aspect.m
//  Objective_AOP
//
//  Created by Lucy_Lee on 16/9/19.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "UINavigationController+Aspect.h"
#import "NSObject+Runtime.h"
#import "HWLoginViewController.h"

@implementation UINavigationController (Aspect)

+(void)load{

    [self hw_swizzleOringinalMethod:@selector(pushViewController:animated:) withMethod:@selector(hw_pushViewController: animated:)];
}

- (void)hw_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //数组数据可以采用类似Java表驱动的做法，采用plist文件统一配置管理，方便维护
    
    NSArray * controllersArray = @[@"HWPersonViewController"];
    
    NSString * className = NSStringFromClass([viewController class]);
    
    if ([controllersArray containsObject:className]){
    
        //加入自己的登陆状态的判断---eg:未登录状态去登陆
        //跳转到登录页面
        HWLoginViewController * login = [[HWLoginViewController alloc] init];
        UINavigationController * navLogin = [[UINavigationController alloc] initWithRootViewController:login];
        [self presentViewController:navLogin animated:YES completion:nil];
        return ;
    }
    
    [self hw_pushViewController:viewController animated:animated];//执行系统方法


}

@end
