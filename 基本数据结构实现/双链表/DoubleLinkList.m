//
//  DoubleLinkList.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/24.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "DoubleLinkList.h"

@implementation DoubleLinkList

- (instancetype)initWithNode:(DoubleLinkListNode *)node {
    self = [super init];
    if (self) {
        self.headNode = node;
    }
    return self;
}

- (BOOL)isEmpty {
    return self.headNode == nil;
}

- (NSInteger)length {
    DoubleLinkListNode *cur = self.headNode;
    NSInteger count = 0;
    while (cur) {
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
    NSInteger i = 0;
    DoubleLinkListNode *cur = self.headNode;
    while (cur) {
        NSLog(@"当前双链表中第%ld个元素为%ld",i++,cur.element);
        cur = cur.nextNode;
    }
}

- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    DoubleLinkListNode *node = [[DoubleLinkListNode alloc] initWithItem:item];
    node.nextNode = self.headNode;
    self.headNode.preNode = node;
    self.headNode = node;
}

- (void)insertNodeAtTailWithItem:(NSInteger)item {
    DoubleLinkListNode *node = [[DoubleLinkListNode alloc] initWithItem:item];
    if ([self isEmpty]) {
        self.headNode = node;
    } else {
        DoubleLinkListNode *cur = self.headNode;
        while (cur.nextNode) {
            cur = cur.nextNode;
        }
        cur.nextNode = node;
        node.preNode = cur;
    }
}

- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    if (index <= 0) {
        [self insertNodeAtHeadWithItem:item];
    } else if (index > [self length] - 1) {
        [self insertNodeAtTailWithItem:item];
    } else {
        DoubleLinkListNode *cur = self.headNode;
        for (int i = 0; i < index - 1; i ++) {
            cur = cur.nextNode;
        }
        DoubleLinkListNode *node = [[DoubleLinkListNode alloc] initWithItem:item];
        //这个是上面不使用index-1，使用index时的写法
//        node.nextNode = cur;
//        node.preNode = cur.preNode;
//        cur.preNode.nextNode = node;
//        cur.preNode = node;
        node.nextNode = cur.nextNode;
        cur.nextNode.preNode = node;
        cur.nextNode = node;
        node.preNode = cur;
        
    }
}

- (void)removeNodeWithItem:(NSInteger)item {
    DoubleLinkListNode *cur = self.headNode;
    while (cur != nil) {
        if (cur.element == item) {
            //判断该节点是不是头节点
            if (cur == self.headNode) {
                self.headNode = cur.nextNode;
                //如果cur.nextNode不为空即表示链表不只有一个节点
                if (cur.nextNode) {
                    //删除头节后后下一个节点的pre节点仍然存储着头节点，所以要置空
                    cur.nextNode.preNode = nil;
                }
            } else {
                //删除普通节点
                //一、将cur的前一个节点的next连接上cur的后一个节点
                cur.preNode.nextNode = cur.nextNode;
                //二、如果cur的后一个节点存在，让cur的后一个节点的prev连上cur的前一个节点
                if (cur.nextNode) {
                    cur.nextNode.preNode = cur.preNode;
                }
            }
        } else {
            cur = cur.nextNode;
        }
    }
}

- (BOOL)searchNodeWithItem:(NSInteger)item {
    DoubleLinkListNode *cur = self.headNode;
    while (cur != nil) {
        if (cur.element == item) {
            return YES;
        } else {
            cur = cur.nextNode;
        }
    }
    return NO;
}

@end
