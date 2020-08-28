//
//  InvertBinaryTree.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/27.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "InvertBinaryTree.h"

@implementation InvertBinaryTree

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

//递归翻转二叉树
- (void)invertBinaryTreeByRecursion:(Node *)rootNode {
    if (rootNode == nil) {
        return;
    }
    Node *temp = rootNode.leftChild;
    rootNode.leftChild = rootNode.rightChild;
    rootNode.rightChild = temp;
    
    [self invertBinaryTreeByRecursion:rootNode.leftChild];
    [self invertBinaryTreeByRecursion:rootNode.rightChild];
}

//非递归翻转二叉树
- (void)invertBinaryTree:(Node *)rootNode {
    if (rootNode == nil) {
        return;
    }
    
    NSMutableArray *queue = [NSMutableArray arrayWithObject:rootNode];
    
    while (queue.count) {
        Node *curNode = queue.firstObject;
        [queue removeObjectAtIndex:0];
        
        Node *temp = curNode.leftChild;
        curNode.leftChild = curNode.rightChild;
        curNode.rightChild = temp;
        
        if (curNode.leftChild) {
            [queue addObject:curNode.leftChild];
        }
        if (curNode.rightChild) {
            [queue addObject:curNode.rightChild];
        }
    }
}

@end
