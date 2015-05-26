//
//  GNForwardingUnkownMessage.m
//  TTPod
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

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
    BOOL isResponding = NO;
    if ([self objectRespondToSelector:aSelector] != nil) {
        isResponding = YES;
    }
    
    return isResponding;
}

+ (BOOL)conformsToProtocol:(Protocol *)protocol {
    BOOL isConforming = NO;
    NSArray *classObjects = [self classObjects];
    for (Class classObject in classObjects) {
        isConforming = [classObject conformsToProtocol:protocol];
        if (isConforming) {
            break;
        }
    }
    
    return isConforming;
}

- (IMP)methodForSelector:(SEL)aSelector {
    return [[self class] instanceMethodForSelector:aSelector];
}

+ (IMP)instanceMethodForSelector:(SEL)aSelector {
    if ([self instancesRespondToSelector:aSelector]) {
        return class_getMethodImplementation(self, aSelector);
    }else {
        return [super instanceMethodForSelector:aSelector];
    }
}

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

- (BOOL)isKindOfClass:(Class)aClass {
    BOOL isKind = NO;
    NSArray *classObjects = [[self class] classObjects];
    for (Class classObject in classObjects) {
        isKind = [classObject isSubclassOfClass:aClass];
        if (isKind) {
            break;
        }
    }
    
    return isKind || [[self class] isSubclassOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    BOOL isMember = NO;
    NSArray *classObjects = [[self class] classObjects];
    for (Class classObject in classObjects) {
        isMember = classObject == aClass;
        if (isMember) {
            break;
        }
    }
    
    return isMember || self == aClass;
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [[self class] conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [[self class] instancesRespondToSelector:aSelector];
}

@end
