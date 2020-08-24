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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本数据结构实现";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self singlyLinkedListTest];//单链表测试
//    [self singlyCycleLinkedListTest];//循环单链表测试
    [self doubleLinkListTest];//双向链表测试
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
@end
