//
//  Node.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/26.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithItem:(NSInteger)item {
    self = [super init];
    if (self) {
        self.element = item;
    }
    return self;
}

@end
