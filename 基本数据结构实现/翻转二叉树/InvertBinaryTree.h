//
//  InvertBinaryTree.h
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface InvertBinaryTree : NSObject

@property (nonatomic, strong) Node *root;

//添加节点
- (void)add:(NSInteger)item;

//广度优先遍历
- (void)breathTraversal;

//递归翻转二叉树
- (void)invertBinaryTreeByRecursion:(Node *)rootNode;

//非递归翻转二叉树
- (void)invertBinaryTree:(Node *)rootNode;
@end

NS_ASSUME_NONNULL_END
