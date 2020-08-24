//
//  DoubleLinkListNode.h
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/24.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DoubleLinkListNode : NSObject

/**
 节点元素值
 */
@property (nonatomic, assign) NSInteger element;

/**
 下一个节点
 */
@property (nonatomic, strong) DoubleLinkListNode *nextNode;

/**
 上一个节点
 */
@property (nonatomic, strong) DoubleLinkListNode *preNode;

- (instancetype)initWithItem:(NSInteger)item;

@end

NS_ASSUME_NONNULL_END
