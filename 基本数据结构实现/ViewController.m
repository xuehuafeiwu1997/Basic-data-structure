//
//  ViewController.m
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/24.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "ViewController.h"
#import "SinglyLinkedList.h"
#import "SinglyCycleLinkedList.h"
#import "DoubleLinkList.h"
#import "DoubleCycleLinkList.h"
#import "BinaryTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本数据结构实现";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self singlyLinkedListTest];//单链表测试
//    [self singlyCycleLinkedListTest];//循环单链表测试
//    [self doubleLinkListTest];//双向链表测试
//    [self doubleCycleLinkListTest];//双向循环链表测试
    [self BinaryTreeTest];//二叉树测试
}

//单链表测试
- (void)singlyLinkedListTest {
    SinglyLinkedList *list = [[SinglyLinkedList alloc] initWithNode:nil];
    NSLog(@"当前单链表是否为空%d",[list isEmpty]);
    NSLog(@"当前单链表的长度为%ld",(long)[list length]);
    
    [list insertNodeAtTailWithItem:1];
    NSLog(@"当前单链表是否为空%d",[list isEmpty]);
    NSLog(@"当前单链表的长度为%ld",(long)[list length]);
    
    [list insertNodeAtTailWithItem:2];
    [list insertNodeAtTailWithItem:3];
    [list insertNodeAtHeadWithItem:0];
    
    [list insertNodeWithItem:100 atIndex:-1];
    [list insertNodeWithItem:200 atIndex:10];
    [list insertNodeWithItem:300 atIndex:3];
    
    [list travel];
}

//循环单链表测试
- (void)singlyCycleLinkedListTest {
    SinglyCycleLinkedList *list = [[SinglyCycleLinkedList alloc] initWithNode:nil];
    NSLog(@"当前循环单链表是否为空%d",[list isEmpty]);
    NSLog(@"当前循环单链表的长度为%ld",[list length]);
    
    [list insertNodeAtTailWithItem:1];
    [list insertNodeAtTailWithItem:2];
    [list insertNodeAtTailWithItem:3];
    [list insertNodeAtHeadWithItem:6];
    [list insertNodeAtTailWithItem:4];
    [list insertNodeAtHeadWithItem:100];
    [list removeNodeWithItem:100];
    NSLog(@"结果为:%d",[list searchNodeWithItem:100]);
    
    [list travel];
}

//双向链表测试
- (void)doubleLinkListTest {
    DoubleLinkList *list = [[DoubleLinkList alloc] initWithNode:nil];
    NSLog(@"当前双向链表是否是空链表%d",[list isEmpty]);
    NSLog(@"当前双向链表的长度为%ld",[list length]);
    
    [list insertNodeAtTailWithItem:0];
    [list insertNodeAtTailWithItem:1];
    [list insertNodeAtTailWithItem:2];
    [list insertNodeAtHeadWithItem:6];
    [list insertNodeWithItem:100 atIndex:1];
    [list insertNodeWithItem:1000 atIndex:1];
    [list travel];
}

//双向循环链表测试
- (void)doubleCycleLinkListTest {
    DoubleCycleLinkList *list = [[DoubleCycleLinkList alloc] initWithNode:nil];
    NSLog(@"当前的链表是否是空链表%d",[list isEmpty]);
    NSLog(@"当前的链表的长度为%ld",[list length]);
    
    [list insertNodeAtTailWithItem:1];
    [list insertNodeAtTailWithItem:2];
    [list insertNodeAtTailWithItem:3];
    [list insertNodeAtTailWithItem:4];
    [list insertNodeAtTailWithItem:5];
    [list insertNodeAtHeadWithItem:0];
    [list removeNodeWithItem:0];
    [list insertNodeWithItem:100 atIndex:0];
    NSLog(@"元素是否在双链表中%d",[list searchNodeWithItem:1000]);
    [list travel];
}

//二叉树测试
- (void)BinaryTreeTest {
    BinaryTree *tree = [[BinaryTree alloc] init];
    for (int i = 0; i < 10; i ++) {
        [tree add:i];
    }
    [tree breathTraversal]; //广序遍历 结果：0 1 2 3 4 5 6 7 8 9
    [tree preOrderTraversal:tree.root]; //前序遍历 结果 0 1 3 7 8 4 9 2 5 6
    [tree inOrderTraversal:tree.root]; //中序遍历 结果 7 3 8 1 9 4 0 5 2 6
    [tree postorderTraversal:tree.root]; //后序遍历 结果 7 8 3 9 4 1 5 6 2 0
}

@end
