//
//  Stack.swift
//  SFDataStruct
//
//  Created by happy on 2018/5/10.
//  Copyright © 2018年 happy. All rights reserved.
//

import Foundation

/// 利用数组模拟栈的结构及操作

public struct Stack<T> {
    
    fileprivate var stackArray = [T]()
    
    public var count: Int {
        return stackArray.count
    }
    
    // is empty ?
    public var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    // top element
    public var top: T? {
        
        if isEmpty {
            return nil
        } else {
            return stackArray.last
        }
        
    }
    
    public mutating func push(_ element: T) {
        stackArray.append(element)
    }
    
    public mutating func pop() -> T? {
        
        if isEmpty {
            return nil
        } else {
            return stackArray.removeLast()
        }
        
    }
    
    public mutating func printAllElements() {
        
        guard count > 0 else {
            return
        }
        
        print("\n print all stack elements:")
        
        for (index, value) in stackArray.enumerated() {
            print("[\(index)] \(value)")
        }
    }
}
