//
//  GNGeneralNull.m
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/5/26.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import "GNGeneralNull.h"
#import "GNPoseAsNSNull.h"

#import <objc/runtime.h>

@implementation GNGeneralNull

+ (void)registerClass:(Class)classObject {
    [GNForwardingUnkownMessage registerClass:classObject];
}

@end

__attribute__((constructor)) void createFakeNSNull() {
    Class childClass = [NSNull class];
    Class parentClass = [GNForwardingUnkownMessage class];
    NSInteger childClassSize = class_getInstanceSize(childClass);
    NSInteger parentClassSize = class_getInstanceSize(parentClass);
    if (childClassSize - parentClassSize >= 0) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        
        class_setSuperclass(childClass, parentClass);
        
#pragma clang diagnostic pop
    } else {
        Method nullMethod = class_getClassMethod([NSNull class], @selector(null));
        Method nullValueMethod = class_getClassMethod([GNPoseAsNSNull class], @selector(nullValue));
        if (nullMethod != nil && nullValueMethod != nil) {
            method_setImplementation(nullMethod, method_getImplementation(nullValueMethod));            
        }
    }
}
