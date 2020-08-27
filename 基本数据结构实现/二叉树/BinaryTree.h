//
//  BinaryTree.h
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/26.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTree : NSObject

@property (nonatomic, strong) Node *root;//根节点

//添加节点
- (void)add:(NSInteger)item;

//广度遍历
- (void)breathTraversal;

//深度遍历：前序遍历
- (void)preOrderTraversal:(Node *)node;

//深度遍历:中序遍历
- (void)inOrderTraversal:(Node *)node;

//深度遍历:后序遍历
- (void)postorderTraversal:(Node *)node;

@end

NS_ASSUME_NONNULL_END
