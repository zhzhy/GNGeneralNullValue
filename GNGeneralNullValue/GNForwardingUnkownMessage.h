//
//  GNForwardingUnkownMessage.h
//  TTPod
//
//  Created by chaoyang.zhang on 15/1/17.
//
//

#import <Foundation/Foundation.h>

@interface GNForwardingUnkownMessage : NSObject

+ (void)registerClass:(Class)classObject withDefaultObject:(id)object;

@end