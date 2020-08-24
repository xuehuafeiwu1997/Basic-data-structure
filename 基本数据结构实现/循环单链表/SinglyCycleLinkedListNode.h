//
//  SinglyCycleLinkedListNode.h
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/24.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SinglyCycleLinkedListNode : NSObject

@property (nonatomic, assign) NSInteger element;
@property (nonatomic, strong) SinglyCycleLinkedListNode *nextNode;

- (instancetype)initWithItem:(NSInteger)item;

@end

NS_ASSUME_NONNULL_END
