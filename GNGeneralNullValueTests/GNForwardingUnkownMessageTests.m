//
//  GNForwardingUnkownMessageTests.m
//  GNForwardingUnkownMessageTests
//
//  Created by DjangoZhang on 15/5/28.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GNForwardingUnkownMessage.h"

@interface GNForwardingUnkownMessageTests : XCTestCase

@end

@implementation GNForwardingUnkownMessageTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_forwarding_shouldWork {
    GNForwardingUnkownMessage *forwarding = [[GNForwardingUnkownMessage alloc] init];
    XCTAssertEqual(0, [(NSString *)forwarding length]);
}

- (void)test_NSNull_superClass_shouldsetup {
    XCTAssertEqual([GNForwardingUnkownMessage class], [(NSArray *)[NSNull null] superclass]);
}

@end
