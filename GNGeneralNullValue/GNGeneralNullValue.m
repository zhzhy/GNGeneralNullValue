//
//  GNGeneralNullValue.m
//  TTPod
//
//  Created by chaoyang.zhang on 15/1/17.
//
//

#import "GNGeneralNullValue.h"
#import "GNDefaultObject.h"

#import <objc/runtime.h>

static GNGeneralNullValue *SingletonNullValue = nil;
static NSMutableArray *PoseAsObjects = nil;

@implementation GNGeneralNullValue

+ (void)initialize {
    if (self == [GNGeneralNullValue class]) {
        PoseAsObjects = [NSMutableArray array];
        [PoseAsObjects addObject:[GNDefaultObject GNDefaultObjectWithClass:[NSString class]
                                                                withObject:@""]];
        [PoseAsObjects addObject:[GNDefaultObject GNDefaultObjectWithClass:[NSNumber class]
                                                                withObject:@0]];
        
    }
}

+ (void)load {
    Method nullMethod = class_getClassMethod([NSNull class], @selector(null));
    Method generalNullMethod = class_getClassMethod(self, @selector(generalNullValue));
    if (nullMethod != nil && generalNullMethod != nil) {
        method_setImplementation(nullMethod, method_getImplementation(generalNullMethod));
    }
}

+ (id)generalNullValue {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SingletonNullValue = [[GNGeneralNullValue alloc] init];
    });
    
    return SingletonNullValue;
}

+ (void)registerClass:(Class)classObject withDefaultObject:(id)object {
    if (classObject != nil) {
        [PoseAsObjects addObject:[GNDefaultObject GNDefaultObjectWithClass:classObject
                                                                withObject:object]];
    }else {
        [NSException raise:@"InvalidArgumentException" format:@"Classname can't be Null!"];
    }
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return SingletonNullValue;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self init];
}

#pragma mark ClassObject

+ (NSArray *)classObjects {
    return [PoseAsObjects valueForKey:@"classObject"];
}

+ (NSArray *)defaultObjects {
    return [PoseAsObjects valueForKey:@"defaultObject"];
}

#pragma mark forwarding

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
    BOOL isResponding = NO;
    NSArray *classObjects = [self classObjects];
    for (Class classObject in classObjects) {
        isResponding = [classObject instancesRespondToSelector:aSelector];
        if (isResponding) {
            break;
        }
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

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [self objectRespondToSelector:aSelector];
}

- (id)objectRespondToSelector:(SEL)aSelector {
    NSArray *defaultObjects = [[self class] defaultObjects];
    for (id defaultObject in defaultObjects) {
        if ([defaultObject respondsToSelector:aSelector]) {
            return defaultObject;
        }
    }
    
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id object = [self objectRespondToSelector:aSelector];
    
    return [object methodSignatureForSelector:aSelector];
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector {
    return [[self generalNullValue] methodSignatureForSelector:aSelector];
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

#pragma mark hash

- (NSUInteger)hash {
    return 0;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if ([object isKindOfClass:[GNGeneralNullValue class]]) {
        return YES;
    }
    
    return NO;
}

- (NSString *)description {
    return @"";
}

@end
