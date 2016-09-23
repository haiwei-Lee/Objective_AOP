//
//  NSObject+Runtime.m
//  Objective_AOP
//
//  Created by Lucy_Lee on 16/9/19.
//  Copyright © 2016年 Lucy_Lee. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

BOOL hw_method_swizzle(Class class, SEL oringSel, SEL newSel){

    if (!class) return NO;
    
    Method __block oringMethod, __block newMethod;
    
    void (^find_methods)() = ^{
        unsigned methodCount = 0;
        Method * methodList = class_copyMethodList(class, &methodCount);
        oringMethod = newMethod = NULL;
        if (methodList) {
            for (unsigned i = 0; i < methodCount; i++) {
                if (method_getName(methodList[i]) == oringSel) {
                    oringMethod = methodList[i];
                }
                if (method_getName(methodList[i]) == newSel) {
                    newMethod = methodList[i];
                }
            }
            
            free(methodList);
        }
    
    };
    
    find_methods();
    
    if (!oringMethod){
        oringMethod = class_getInstanceMethod(class , oringSel);
        if (!oringMethod) return NO;
        
        if (!class_addMethod(class, method_getName(oringMethod), method_getImplementation(oringMethod), method_getTypeEncoding(oringMethod)))
            return NO;
    }
    if (!newMethod)
    {
        newMethod = class_getInstanceMethod(class , newSel);
        
        if (!newMethod)
            return NO;
        
        if (!class_addMethod(class, method_getName(newMethod), method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
            return NO;
    }
    
    find_methods();
    
    if (!oringMethod || !newMethod) return NO;
    
    method_exchangeImplementations(oringMethod, newMethod);


    return YES;
}

@implementation NSObject (Runtime)

+ (void)hw_swizzleOringinalMethod:(SEL)oringinalMethod withMethod:(SEL)newMethod{

    hw_method_swizzle(self.class, oringinalMethod, newMethod);
}


@end
