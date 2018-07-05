//
//  ReverseSequence.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation


/***
 for ... in的实现如下:
 var iterator = ReverseIterator(array: [1, 2, 3, 4, 5])
 while let obj = iterator.next() {
  print(obj)
 }
 ***/

class ReverseIterator<T>: IteratorProtocol {
  typealias Element = T
  
  let array: [T]
  
  var currentIndex: Int = 0
  
  init(array: [T]) {
    self.array = array
    self.currentIndex = array.count - 1
  }
  
  func next() -> ReverseIterator.Element? {
    guard currentIndex >= 0 else { return nil }
    let element = array[currentIndex]
    currentIndex -= 1
    return element
  }
  
}

class ReverseSequence<T>: Sequence {
  
  let array: [T]
  
  init(array: [T]) {
    self.array = array
  }
  
  func makeIterator() -> ReverseIterator<T> {
    return ReverseIterator(array: array)
  }
  
}

func traverse() {
  var iterator = ReverseIterator(array: [1, 2, 3, 4, 5])
  while let obj = iterator.next() {
    print(obj)
  }
}
