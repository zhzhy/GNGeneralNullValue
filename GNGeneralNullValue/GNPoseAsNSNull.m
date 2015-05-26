//
//  GNPoseAsNSNull.m
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/5/26.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import "GNPoseAsNSNull.h"

static GNPoseAsNSNull *SingletonNullValue = nil;

@implementation GNPoseAsNSNull

+ (id)nullValue {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SingletonNullValue = [[GNPoseAsNSNull alloc] init];
    });
    
    return SingletonNullValue;
}

+ (Class)class {
    return [NSNull class];
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self init];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}


- (BOOL)isNSNull:(Class)aClass {
    return aClass == [NSNull class] || aClass == [GNPoseAsNSNull class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [self isNSNull:aClass] || [super isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [self isNSNull:aClass] || [super isMemberOfClass:aClass];
}

@end
