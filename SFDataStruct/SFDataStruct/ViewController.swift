//
//  ViewController.swift
//  SFDataStruct
//
//  Created by happy on 2018/5/10.
//  Copyright © 2018年 happy. All rights reserved.
//  各种算法的练习

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inputSize = 10
        
        var originalArray = [1, 4, 80, 83, 92, 63, 83, 23, 9, 85] //Array<Int>.randomArray(size: inputSize, maxValue: 100)
        
        print("original array : \n \(originalArray) \n")
        
//        let array = bubbleSort(&originalArray)
        
//        print("result = \(array)")
        
        var selectionSortedArray = [Int]()
        let time4 = executionTimeInterval{
            selectionSortedArray = bubbleSort(&originalArray) //要测试的函数
        }
        
        print("selection sort time duration : \(time4.formattedTime)") //打印出时间
        
    }
    
    /// 快速排序
    func quickSort0<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else {
            return array
        }
        
        let pivot = array[array.count/2]
        let less = array.filter { $0 < pivot }
        let greater = array.filter { $0 > pivot }
        
        return quickSort0(less) + quickSort0(greater)
    }
    
    /// 归并排序
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return _merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    func _merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var sortedPile = [Int]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            
            if leftPile[leftIndex] < rightPile[rightIndex] {
                sortedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                sortedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                
                sortedPile.append(leftPile[leftIndex])
                leftIndex += 1
                sortedPile.append(rightPile[rightIndex])
                rightIndex += 1
                
            }
            
        }
        
        while leftIndex < leftPile.count {
            sortedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            sortedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return sortedPile
        
    }
    
    /// 插入排序
    func insertionSort(_ array: inout [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        
        for i in 1..<array.count {
            
            var j = i
            while j>0 && array[j] < array[j - 1] {
                array.swapAt(j-1, j)
                j -= 1
            }
            
        }
        return array
    }
    
    /// 选择排序
    func selectionSort(_ array: inout [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        
        for i in 0..<array.count - 1 {
            
            var min = i
            
            for j in (i+1)..<array.count {
                
                if array[j] < array[min] {
                    min = j
                }
                
            }
            
            if i != min {
                array.swapAt(i, min)
            }
        }
        
        return array
    }
    
    /// 冒泡排序
    func bubbleSort(_ array: inout [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        
        for i in 0..<array.count - 1 {
            
            var swapped = false
            
            for j in 0..<array.count - 1 - i {
                
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                    swapped = true
                    print("\(array)")
                }
                
                // 判断数组有序后,提前结束循环
                if swapped == false {
                    break
                }
            }
            
        }
        return array
    }
    
    /// 交换排序
    func switchSort(_ array: inout [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        
        for i in 0..<array.count {
            
            for j in (i+1)..<array.count {
                
                if array[i] > array[j] {
                    array.swapAt(i, j)
                    print("\(array)")
                }
                
            }
            
        }
        
        return array
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

