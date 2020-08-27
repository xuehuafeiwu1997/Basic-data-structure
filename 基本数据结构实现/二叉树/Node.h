//
//  Node.h
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/26.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

/**
 节点元素
 */
@property (nonatomic, assign) NSInteger element;

/**
 左子树
 */
@property (nonatomic, strong) Node *leftChild;

/**
 右子树
 */
@property (nonatomic, strong) Node *rightChild;

- (instancetype)initWithItem:(NSInteger)item;

@end

NS_ASSUME_NONNULL_END
