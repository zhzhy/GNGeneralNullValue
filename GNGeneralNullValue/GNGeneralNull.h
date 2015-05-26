//
//  GNGeneralNull.h
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/5/26.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class is not thread-safe, so you should invoke -[GNGeneralNullValue registerClass:withDefaultObject] when app load finished.
 */
@interface GNGeneralNull : NSObject

/**
 This method is not thread-safe, should be invoked at -[UIApplication application: didFinishLaunchingWithOptions:].
 */
+ (void)registerClass:(Class)classObject withDefaultObject:(id)object;

@end
