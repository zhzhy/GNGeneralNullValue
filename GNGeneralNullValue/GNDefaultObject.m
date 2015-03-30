//
//  GNDefaultObject.m
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/3/29.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import "GNDefaultObject.h"

@interface GNDefaultObject ()

@property(nonatomic, retain, readwrite) id defaultObject;
@property(nonatomic, assign, readwrite) Class classObject;
@end

@implementation GNDefaultObject

- (instancetype)initWithClass:(Class)classObject withObject:(id)object {
    if (self = [super init]) {
        _defaultObject = object;
        _classObject = classObject;
    }
    
    return self;
}

+ (instancetype)GNDefaultObjectWithClass:(Class)classObject withObject:(id)object {
    return [[self alloc] initWithClass:classObject withObject:object];
}

- (id)defaultObject {
    if (_defaultObject == nil) {
        _defaultObject = [[self.classObject alloc] init];
    }
    
    return _defaultObject;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    GNDefaultObject *duplicate = [[GNDefaultObject alloc] init];
    duplicate.defaultObject = self.defaultObject;
    duplicate.classObject = self.classObject;
    
    return duplicate;
}

- (NSUInteger)hash {
    return [self.defaultObject hash] ^ [self.classObject hash];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if ([object isKindOfClass:[self class]]) {
        GNDefaultObject *another = object;
        if (self.defaultObject == another.defaultObject &&
            self.classObject == another.classObject) {
            return YES;
        }
    }
    
    return NO;
}

@end
