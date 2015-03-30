//
//  GNDefaultObject.h
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/3/29.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNDefaultObject : NSObject<NSCopying>
@property(nonatomic, retain, readonly) id defaultObject;
@property(nonatomic, assign, readonly) Class classObject;

- (instancetype)initWithClass:(Class)classObject withObject:(id)object;

+ (instancetype)GNDefaultObjectWithClass:(Class)classObject withObject:(id)object;

@end
