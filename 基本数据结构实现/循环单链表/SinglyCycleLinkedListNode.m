//
//  SinglyCycleLinkedListNode.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/24.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SinglyCycleLinkedListNode.h"

@implementation SinglyCycleLinkedListNode

- (instancetype)initWithItem:(NSInteger)item {
    self = [super init];
    if (self) {
        self.element = item;
    }
    return self;
}

@end
