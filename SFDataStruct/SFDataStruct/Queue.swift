//
//  Queue.swift
//  SFDataStruct
//
//  Created by happy on 2018/5/10.
//  Copyright © 2018年 happy. All rights reserved.
//

import Foundation

/// 数组模拟队列的数据结构

public struct Queue<T> {
    
    fileprivate var queueArray = [T]()
    
    
    public var count: Int {
        return queueArray.count
    }
    
    public var isEmpty: Bool {
        return queueArray.isEmpty
    }
    
    /// front element
    public var front: T? {
        
        if isEmpty {
            return nil
        } else {
            return queueArray.first
        }
        
    }
    
    /// add element
    public mutating func enqueue(_ element: T) {
        queueArray.append(element)
    }
    
    /// remove element
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queueArray.removeFirst()
        }
    }
    
    public mutating func printAllElements() {
        
        guard count > 0 else {
            return
        }
        
        print("\n print all queue elements:")
        
        for (index, value) in queueArray.enumerated() {
            print("[\(index)]  \(value)")
        }
    }
    
    
    
}
