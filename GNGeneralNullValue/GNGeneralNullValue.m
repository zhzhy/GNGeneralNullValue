//
//  TTNullValue.m
//  TTPod
//
//  Created by chaoyang.zhang on 15/1/17.
//
//

#import "TTNullValue.h"

#import <objc/runtime.h>

@implementation TTNullValue

+ (id)nullValue {
    return [[[TTNullValue alloc] init] autorelease];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[TTNullValue alloc] init];
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self init];
}

#pragma mark forwarding

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
    BOOL isResponding = NO;
    if ([NSString instancesRespondToSelector:aSelector]) {
        isResponding = YES;
    }else if ([NSNumber instancesRespondToSelector:aSelector]) {
        isResponding = YES;
    }else if ([super instancesRespondToSelector:aSelector]) {
        isResponding = YES;
    }
    
    return isResponding;
    
}

+ (BOOL)conformsToProtocol:(Protocol *)protocol {
    BOOL isConforming = NO;
    if ([NSString conformsToProtocol:protocol]) {
        isConforming = YES;
    }else if ([NSNumber conformsToProtocol:protocol]) {
        isConforming = YES;
    }else if ([super conformsToProtocol:protocol]) {
        isConforming = YES;
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

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [self objectRespondToSelector:aSelector];
}

- (id)objectRespondToSelector:(SEL)aSelector {
    if ([NSString instancesRespondToSelector:aSelector]) {
        return @"";
    }else if ([NSNumber instancesRespondToSelector:aSelector]) {
        return @0;
    }else {
        return nil;
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id object = [self objectRespondToSelector:aSelector];
    
    return [object methodSignatureForSelector:aSelector];
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector {
    TTNullValue *nullValue = [[TTNullValue alloc] init];
    NSMethodSignature *signature = [nullValue methodSignatureForSelector:aSelector];
    [nullValue release];
    
    return signature;
}

- (BOOL)isKindOfClass:(Class)aClass {
    BOOL isKind = NO;
    if ([NSString isSubclassOfClass:aClass]) {
        isKind = YES;
    }else if ([NSNumber isSubclassOfClass:aClass]) {
        isKind = YES;
    }else {
        isKind = [[self class] isSubclassOfClass:aClass];
    }
    
    return isKind;
}

- (BOOL)isMemberOfClass:(Class)aClass {
    BOOL isMember = NO;
    if ([NSString isSubclassOfClass:aClass]) {
        isMember = YES;
    }else if ([NSNumber isSubclassOfClass:aClass]) {
        isMember = YES;
    }else {
        isMember = [self class] == aClass;
    }
    
    return isMember;
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [[self class] conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [[self class] instancesRespondToSelector:aSelector];
}

#pragma mark hash

- (NSUInteger)hash {
    return 0;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[TTNullValue class]]) {
        return YES;
    }
    
    return NO;
}

- (NSString *)description {
    return @"";
}

@end
