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

- (void)test_NSNumber_integerValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0, [number integerValue]);
}

- (void)test_NSNumber_intValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0, [number intValue]);
}

- (void)test_NSNumber_charValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0, [number charValue]);
}

- (void)test_NSNumber_floatValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0.0f, [number floatValue]);
}

- (void)test_NSNumber_doubleValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0.0, [number doubleValue]);
}

- (void)test_NSNumber_boolValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(NO, [number boolValue]);
}

- (void)test_NSNumber_CGRectValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    CGPoint point = [number CGPointValue];
    XCTAssertTrue(CGPointEqualToPoint(CGPointZero, point));
}

- (void)test_NSNumber_CGSizeValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    CGSize size = [number CGSizeValue];
    XCTAssertTrue(CGSizeEqualToSize(CGSizeMake(0.0f, 0.0f), size));
}

- (void)test_NSNumber_stringValue_shouldResponse {
    NSNumber *number = (NSNumber *)[GNPoseAsNSNull nullValue];
    XCTAssertEqualObjects(nil, [number stringValue]);
}

- (void)test_NSString_intValue_shouldResponse {
    NSString *string = (NSString *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0, [string intValue]);
}

- (void)test_NSString_floatValue_shouldResponse {
    NSString *string = (NSString *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0.0f, [string floatValue]);
}

- (void)test_NSString_doubleValue_shouldResponse {
    NSString *string = (NSString *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(0.0, [string doubleValue]);
}

- (void)test_NSString_boolValue_shouldResponse {
    NSString *string = (NSString *)[GNPoseAsNSNull nullValue];
    XCTAssertEqual(NO, [string boolValue]);
}

- (void)test_NSNull_ShouldReturnGNPoseAsNSNull {
    XCTAssertTrue([[NSNull null] isKindOfClass:[GNPoseAsNSNull class]]);
}

@end
