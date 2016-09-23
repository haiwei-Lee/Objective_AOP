//
//  UINavigationController+Aspect.h
//  Objective_AOP
//
//  Created by Lucy_Lee on 16/9/19.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Aspect)

- (void)hw_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
