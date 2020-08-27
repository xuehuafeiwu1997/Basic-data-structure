//
//  BinaryTree.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/26.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "BinaryTree.h"

@interface BinaryTree()

@end

@implementation BinaryTree

//添加节点
- (void)add:(NSInteger)item {
    Node *node = [[Node alloc] initWithItem:item];
    if (self.root == nil) {
        self.root = node;
        return;
    }
    
    NSMutableArray *queue = [NSMutableArray array];
    [queue addObject:self.root];
    while (queue.count) {
        Node *curNode = queue.firstObject;
        [queue removeObjectAtIndex:0];
        
        if (curNode.leftChild == nil) {
            curNode.leftChild = node;
            return;
        } else {
            [queue addObject:curNode.leftChild];
        }
        if (curNode.rightChild == nil) {
            curNode.rightChild = node;
            return;
        } else {
            [queue addObject:curNode.rightChild];
        }
    }
}

- (void)breathTraversal {
    if (self.root == nil) {
        return;
    }
    
    NSMutableArray *queue = [NSMutableArray array];
    [queue addObject:self.root];
    while (queue.count) {
        Node *curNode = queue.firstObject;
        [queue removeObjectAtIndex:0];
        NSLog(@"当前的元素为%ld",(long)curNode.element);
        
        if (curNode.leftChild != nil) {
            [queue addObject:curNode.leftChild];
        }
        if (curNode.rightChild != nil) {
            [queue addObject:curNode.rightChild];
        }
    }
}

//深度遍历：前序遍历
- (void)preOrderTraversal:(Node *)node {
    if (node == nil) {
        return;
    }
    NSLog(@"前序遍历：当前的元素为%ld",(long)node.element);
    [self preOrderTraversal:node.leftChild];
    [self preOrderTraversal:node.rightChild];
}

//深度遍历：中序遍历
- (void)inOrderTraversal:(Node *)node {
    if (node == nil) {
        return;
    }
    [self inOrderTraversal:node.leftChild];
    NSLog(@"中序遍历:当前的元素为%ld",(long)node.element);
    [self inOrderTraversal:node.rightChild];
}

//深度遍历:后序遍历
- (void)postorderTraversal:(Node *)node {
    if (node == nil) {
        return;
    }
    [self postorderTraversal:node.leftChild];
    [self postorderTraversal:node.rightChild];
    NSLog(@"后序遍历:当前的元素为%ld",(long)node.element);
}

@end
