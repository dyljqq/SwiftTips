//
//  ClassSelf.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/12.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

protocol Copyable {
  func copy() -> Self
}

class MyClass: Copyable {
  
  var num = 1
  
  func copy() -> Self {
//    let c = MyClass() // error..
    let c = type(of: self).init() // dynamic type
    c.num = num
    return c
  }
  
  required init() {
    
  }
  
}

struct ClassSelf {
  
  static func test() {
    let obj = MyClass()
    obj.num = 100
    
    let newObj = obj.copy()
    obj.num = 1
    
    print(obj.num)
    print(newObj.num)
  }
  
}

func typeOfAppleExample() {
  func printInfo(_ value: Any) {
    let t = type(of: value)
    print("'\(value)' of type '\(t)'")
  }
  
  let count: Int = 5
  printInfo(count)
}
