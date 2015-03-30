//
//  GNGeneralNullValue.h
//  TTPod
//
//  Created by chaoyang.zhang on 15/1/17.
//
//

#import <Foundation/Foundation.h>

/**
 This class is not thread-safe, so you should invoke -[GNGeneralNullValue registerClass:withDefaultObject] when app load finished.
 */
@interface GNGeneralNullValue : NSObject<NSCopying, NSCoding>

+ (instancetype)generalNullValue;

/**
 This method is not thread-safe, should be invoked at -[UIApplication application: didFinishLaunchingWithOptions:].
 */
+ (void)registerClass:(Class)classObject withDefaultObject:(id)object;

@end
