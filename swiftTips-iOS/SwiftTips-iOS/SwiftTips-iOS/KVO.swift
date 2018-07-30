//
//  KVO.swift
//  SwiftTips-iOS
//
//  Created by 季勤强 on 2018/7/30.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import UIKit

class MyClass: NSObject {
  @objc dynamic var date = Date()
}

private var myContext = 0

class Class: NSObject {
  
  var myObject: MyClass!
  var observation: NSKeyValueObservation?
  
  override init() {
    super.init()
    myObject = MyClass()
    
    print("初始化MyClass，当前日期: \(myObject.date)")
    myObject.addObserver(self, forKeyPath: "date", options: .new, context: &myContext)
    
    observation = myObject.observe(\MyClass.date, options: [.new], changeHandler: { (_, change) in
      if let newDate = change.newValue {
        print("MyClass 日期发生变化: \(newDate)")
      }
    })
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if let change = change, context == &myObject {
      if let newDate = change[.newKey] as? Date {
        print("MyClass 日期发生变化: \(newDate)")
      }
    }
  }
  
}
