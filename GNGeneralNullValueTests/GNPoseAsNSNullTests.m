//
//  GNPoseAsNSNullTests.m
//  GNPoseAsNSNullTests
//
//  Created by DjangoZhang on 15/3/22.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GNPoseAsNSNull.h"

@interface GNPoseAsNSNullTests: XCTestCase

@end

@implementation GNPoseAsNSNullTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_GNPoseAsNSNull_ShouldPoseAsNSNull {
    XCTAssertTrue([GNPoseAsNSNull class] == [NSNull class]);
}

- (void)test_GNPoseAsNSNull_instance_ShouldisMemberOfClass {
    GNPoseAsNSNull *null = [GNPoseAsNSNull nullValue];
    XCTAssertTrue([null isMemberOfClass:[NSNull class]]);
}

- (void)test_GNPoseAsNSNull_instance_ShouldisKindOfClass {
    GNPoseAsNSNull *null = [GNPoseAsNSNull nullValue];
    XCTAssertTrue([null isKindOfClass:[NSNull class]]);
}

- (void)test_GNPoseAsNSNull_ShouldCopy {
    GNPoseAsNSNull *null = [GNPoseAsNSNull nullValue];
    GNPoseAsNSNull *copyNull = [null copy];
    XCTAssertEqualObjects(null, copyNull);
}

- (void)test_GNPoseAsNSNull_ShouldSerialization {
    GNPoseAsNSNull *null = [GNPoseAsNSNull nullValue];
    NSData *archivedNull = [NSKeyedArchiver archivedDataWithRootObject:null];
    GNPoseAsNSNull *unarchivedNull = [NSKeyedUnarchiver unarchiveObjectWithData:archivedNull];
    XCTAssertEqualObjects(null, unarchivedNull);
}

@end
