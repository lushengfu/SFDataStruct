//
//  LinkedListNode.swift
//  SFDataStruct
//
//  Created by happy on 2018/5/10.
//  Copyright © 2018年 happy. All rights reserved.
//

import Foundation

/// 链表的单个节点
public class LinkedListNode<T> {
    
    var value: T
    
    weak var previous: LinkedListNode?
    
    var next: LinkedListNode?
    
    
    public init(value: T) {
        self.value = value
    }
    
    
}


public class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    //total count of nodes
    public var count: Int {
        
        guard var node = head else {
            return 0
        }
        
        var count = 1
        
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    private var head: Node?
    
    // pointer to the first node, public
    public var first: Node? {
        return head
    }
    
    // pointer to the last node
    public var last: Node? {
        
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    
    /// get node of index
    ///
    /// - Parameter index: 某个节点的索引
    /// - Returns: 返回当前索引的节点
    public func node(atIndex index: Int) -> Node? {
        
        if index == 0 {
            return head
        } else {
            
            var node = head?.next
            
            guard index < count else {
                return nil
            }
            
            for _ in 1..<index {
                
                node = node?.next
                
                if node == nil {
                    break
                }
                
            }
            
            return node
        }
        
    }
    
    /// insert node to last index
    public func appendToTail(value: T) {
        
        let newNode = Node(value: value)
        
        if let lastNode = last {
            // update last node: newNode becomes new last node
            newNode.previous = lastNode
            // the previous last node becomes the second-last node
            lastNode.next = newNode
            
        } else {
            
            head = newNode
        }
        
    }
    
    /// insert node to index 0
    public func insertToHead(value: T) {
        
        let newHead = Node(value: value)
        
        if head == nil {
            head = newHead
        } else {
            
            newHead.next = head
            
            head?.previous = newHead
            
            head = newHead
        }
        
    }
    
    /// insert node in specific index
    public func insert(_ node: Node, atIndex index: Int) {
        
        if index < 0 {
            return
        }
        
        let newNode = node
        
        if count == 0 {
            head = newNode
        } else {
            
            if index == 0 {
                newNode.next = head
                head?.previous = newNode
                head = newNode
            } else {
                
                if index > count {
                    return
                }
                
                let prev = self.node(atIndex: index - 1)
                let next = prev?.next
                
                newNode.previous = prev
                newNode.next = prev?.next
                
                prev?.next = newNode
                next?.previous = newNode
            }
            
        }
        
    }
    
    /// removing all nodes
    public func removeAll() {
        head = nil
    }
    
    /// remove a node by it is refrence
    public func remove(node: Node) -> T? {
        
        guard head != nil else {
            return nil
        }
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    /// remove the last node
    public func removeLast() -> T? {
        
        guard !isEmpty else {
            return nil
        }
        
        return remove(node: last!)
        
    }
    
    /// remove a node by it is index
    public func removeAt(_ index: Int) -> T? {
        
        guard head != nil else {
            return nil
        }
        
        let node = self.node(atIndex: index)
        
        guard node != nil else {
            return nil
        }
        
        return remove(node: node!)
    }
    
    /// 打印链表的所有节点
    public func printAllNodes() {
        
        guard head != nil else {
            return
        }
        
        var node = head
        
        print("\n start printing all nodes:")
        
        for index in 0..<count {
            if node == nil {
                break
            }
            
            print("[\(index)] \(String(describing: node?.value))")
            node = node?.next
        }
        
    }
    
}
