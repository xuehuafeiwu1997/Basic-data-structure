//
//  DoubleCycleLinkList.h
//  基本数据结构实现
//
//  Created by 许明洋 on 2020/8/25.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoubleCycleLinkListNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoubleCycleLinkList : NSObject

//链表的头节点
@property (nonatomic, strong) DoubleCycleLinkListNode *headNode;

//初始化一个双向链表
- (instancetype)initWithNode:(DoubleCycleLinkListNode *)node;

//判断链表是否为空
- (BOOL)isEmpty;

//获取链表拥有的总字节数
- (NSInteger)length;

//遍历链表
- (void)travel;

//头插法：在链表的头部插入节点
- (void)insertNodeAtHeadWithItem:(NSInteger)item;

//尾插法:在链表的尾部插入节点
- (void)insertNodeAtTailWithItem:(NSInteger)item;

//指定位置插入节点
- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index;

//删除节点
- (void)removeNodeWithItem:(NSInteger)item;

//查询某个节点是否存在
- (BOOL)searchNodeWithItem:(NSInteger)item;
@end

NS_ASSUME_NONNULL_END
