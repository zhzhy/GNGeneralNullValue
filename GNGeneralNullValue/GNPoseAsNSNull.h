//
//  GNPoseAsNSNull.h
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/5/26.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import "GNForwardingUnkownMessage.h"

@interface GNPoseAsNSNull : GNForwardingUnkownMessage<NSCopying, NSCoding>

+ (id)nullValue;

@end
