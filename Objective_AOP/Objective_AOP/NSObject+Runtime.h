//
//  NSObject+Runtime.h
//  Objective_AOP
//
//  Created by Lucy_Lee on 16/9/19.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)


/**
 方法交换

 @param oringinalMethod 被替换的方法（原始方法）
 @param newMethod       替换的方法（新方法）
 */
+ (void)hw_swizzleOringinalMethod:(SEL)oringinalMethod withMethod:(SEL)newMethod;

@end
