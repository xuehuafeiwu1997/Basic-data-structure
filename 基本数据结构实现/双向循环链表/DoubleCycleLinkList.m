//
//  DoubleCycleLinkList.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/25.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "DoubleCycleLinkList.h"

@implementation DoubleCycleLinkList

- (instancetype)initWithNode:(DoubleCycleLinkListNode *)node {
    self = [super init];
    if (self) {
        self.headNode = node;
        
        //判断node不为空的情况,循环指向自己
        node.nextNode = node;
        node.preNode = node;
    }
    return self;
}

- (BOOL)isEmpty {
    return self.headNode == nil;
}

- (NSInteger)length {
    if ([self isEmpty]) {
        return 0;
    }
    DoubleCycleLinkListNode *cur = self.headNode;
    NSInteger count = 1;
    while (cur.nextNode != self.headNode) {
        count++;
        cur = cur.nextNode;
    }
    return count;
}

- (void)travel {
    //空链表的情况
    if ([self isEmpty]) {
        return;
    }
    DoubleCycleLinkListNode *cur = self.headNode;
    NSInteger i = 0;
    while (cur.nextNode != self.headNode) {
        NSLog(@"链表的第%ld个元素为%ld:",i++,cur.element);
        cur = cur.nextNode;
    }
    //退出循环，只有链表最后一个元素未输出
    NSLog(@"链表的第%ld个元素为%ld:",i++,cur.element);
}

- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    DoubleCycleLinkListNode *node = [[DoubleCycleLinkListNode alloc] initWithItem:item];
    //空链表的情况
    if ([self isEmpty]) {
        self.headNode = node;
        node.nextNode = node;
        node.preNode = node;
    } else {
        DoubleCycleLinkListNode *cur = self.headNode;
        //获取尾部节点的指针
        while (cur.nextNode != self.headNode) {
            cur = cur.nextNode;
        }
        cur.nextNode = node;
        node.preNode = cur;
        node.nextNode = self.headNode;
        self.headNode.preNode = node;
        
        self.headNode = node;
    }
    
}

- (void)insertNodeAtTailWithItem:(NSInteger)item {
    DoubleCycleLinkListNode *node = [[DoubleCycleLinkListNode alloc] initWithItem:item];
    //空链表的情况
    if ([self isEmpty]) {
        self.headNode = node;
        node.nextNode = node;
        node.preNode = node;
    } else {
        DoubleCycleLinkListNode *cur = self.headNode;
        while (cur.nextNode != self.headNode) {
            cur = cur.nextNode;
        }
        cur.nextNode = node;
        node.preNode = cur;
        node.nextNode = self.headNode;
        self.headNode.preNode = node;
    }
}

- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    if (index <= 0) {
        [self insertNodeAtHeadWithItem:item];
    } else if (index > [self length] - 1) {
        [self insertNodeAtTailWithItem:item];
    } else {
        DoubleCycleLinkListNode *node = [[DoubleCycleLinkListNode alloc] initWithItem:item];
        DoubleCycleLinkListNode *cur = self.headNode;
        for (int i = 0; i < index; i++) {
            cur = cur.nextNode;
        }
        cur.preNode.nextNode = node;
        node.preNode = cur.preNode;
        node.nextNode = cur;
        cur.preNode = node;
    }
}

- (void)removeNodeWithItem:(NSInteger)item {
    //空链表的情况
    if ([self isEmpty]) {
        return;
    }
    DoubleCycleLinkListNode *cur = self.headNode;
    while (cur.nextNode != self.headNode) {
        if (cur.element == item) {
            //1.删除头节点的情况
            if (cur == self.headNode) {
                DoubleCycleLinkListNode *tail = self.headNode;
                while (tail.nextNode != self.headNode) {
                    tail = tail.nextNode;
                }
                tail.nextNode = cur.nextNode;
                cur.nextNode.preNode = tail;
                self.headNode = cur.nextNode;
            } else {
                //2.删除非头节点的情况
                cur.preNode.nextNode = cur.nextNode;
                cur.nextNode.preNode = cur.preNode;
            }
            return;
        } else {
            cur = cur.nextNode;
        }
    }
    //循环结束，还有最后一个节点没有判断
    if (cur.element == item) {
        if (cur == self.headNode) {
            //表中只有一个头节点的情况
            self.headNode = nil;
        } else {
            cur.preNode.nextNode = cur.nextNode;
            cur.nextNode.preNode = cur.preNode;
        }
    }
}

- (BOOL)searchNodeWithItem:(NSInteger)item {
    if ([self isEmpty]) {
        return NO;
    }
    DoubleCycleLinkListNode *cur = self.headNode;
    while (cur.nextNode != self.headNode) {
        if (cur.element == item) {
            return YES;
        } else {
            cur = cur.nextNode;
        }
    }
    //退出循环,cur指向尾节点
    if (cur.element == item) {
        return YES;
    }
    return NO;
    
}

@end
