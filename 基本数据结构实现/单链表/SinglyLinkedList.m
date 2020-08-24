//
//  SinglyLinkedList.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/24.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SinglyLinkedList.h"

@implementation SinglyLinkedList

- (instancetype)initWithNode:(SinglyLinkedListNode *)node {
    self = [super init];
    if (self) {
        self.headNode = node;
    }
    return self;
}

- (BOOL)isEmpty {
    //当单链表的头节点为nil时，代表单链表为空链表
    return self.headNode == nil;
}

- (NSInteger)length {
    SinglyLinkedListNode *cur = self.headNode;
    
    NSInteger count = 0;
    while (cur) {
        count++;
        cur = cur.nextNode;
    }
    return count;
}

- (void)travel {
    if ([self isEmpty]) {
        return;
    }
    NSInteger i = 0;
    SinglyLinkedListNode *cur = self.headNode;
    while (cur) {
        NSLog(@"链表第%ld个元素为%ld",i+1,(long)cur.element);
        cur = cur.nextNode;
        i++;
    }
}

- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    SinglyLinkedListNode *node = [[SinglyLinkedListNode alloc] initWithItem:item];
    node.nextNode = self.headNode;
    self.headNode = node;
}

- (void)insertNodeAtTailWithItem:(NSInteger)item {
    SinglyLinkedListNode *node = [[SinglyLinkedListNode alloc] initWithItem:item];
    if ([self isEmpty]) {
        self.headNode = node;
    } else {
        SinglyLinkedListNode *cur = self.headNode;
        
        while (cur.nextNode) {
            cur = cur.nextNode;
        }
        cur.nextNode = node;
    }
}

- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    if (index > [self length] + 1) {
        [self insertNodeAtTailWithItem:item];
    } else if (index <= 0) {
        [self insertNodeAtHeadWithItem:item];
    } else {
        SinglyLinkedListNode *preNode = self.headNode;
        for (int i = 0; i < index - 1; i++) {
            preNode = preNode.nextNode;
        }
        
        SinglyLinkedListNode *node = [[SinglyLinkedListNode alloc] initWithItem:item];
        node.nextNode = preNode.nextNode;
        preNode.nextNode = node;
    }
}

- (void)removeNodeWithItem:(NSInteger)item {
    //关键点在于头节点的判断以及获取删除的节点的前后节点，将其链接起来
    SinglyLinkedListNode *cur = self.headNode;
    SinglyLinkedListNode *pre = [[SinglyLinkedListNode alloc] init];
    while (cur) {
        if (cur.element == item) {
            //如果是头节点
            if (cur == self.headNode) {
                self.headNode = cur.nextNode;
            } else {
                pre.nextNode = cur.nextNode;
            }
            cur = nil;
            break;
        } else {
            pre = cur;
            cur = cur.nextNode;
        }
    }
}

- (BOOL)searchNodeWithItem:(NSInteger)item {
    SinglyLinkedListNode *cur = self.headNode;
    while (cur) {
        if (cur.element == item) {
            return YES;
        }
    }
    return NO;
}
@end
