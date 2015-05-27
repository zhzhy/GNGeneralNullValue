//
//  GNForwardingUnkownMessage.m
//  GNGeneralNullValue
//
//  Created by chaoyang.zhang on 15/1/17.
//
//

#import "GNForwardingUnkownMessage.h"

#import <objc/runtime.h>

static NSMutableArray *PoseAsObjects = nil;

@implementation GNForwardingUnkownMessage

+ (void)initialize {
    if (self == [GNForwardingUnkownMessage class]) {
        PoseAsObjects = [NSMutableArray array];
        [PoseAsObjects addObject:[NSString class]];
        [PoseAsObjects addObject:[NSNumber class]];
    }
}

+ (void)registerClass:(Class)classObject {
    if (classObject != nil) {
        [PoseAsObjects addObject:classObject];
    }else {
        [NSException raise:@"InvalidArgumentException" format:@"Classname can't be Null!"];
    }
}

#pragma mark ClassObject

+ (NSArray *)classObjects {
    return PoseAsObjects;
}

#pragma mark forwarding

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:nil];
}

+ (id)objectRespondToSelector:(SEL)aSelector {
    NSArray *defaultClasses = [self classObjects];
    for (Class defaultClass in defaultClasses) {
        if ([defaultClass instancesRespondToSelector:aSelector]) {
            return defaultClass;
        }
    }
    
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [[self class] instanceMethodSignatureForSelector:aSelector];
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector {
    return [[self objectRespondToSelector:aSelector] instanceMethodSignatureForSelector:aSelector];
}

@end
