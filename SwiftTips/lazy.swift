//
//  lazy.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/16.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

// 惰性加载主要可以提升性能，避免一些不必要的开销

func noLazy() {
  let data = 1...3
  let result = data.map { i -> Int in
    print("正在处理: \(i)")
    return i * 2
  }
  
  for i in result {
    print("结束处理: \(i)")
  }
}

func useLazy() {
  let data = 1...3
  
  // be careful of this lazy modifier...
  let result = data.lazy.map { i -> Int in
    print("正在处理: \(i)")
    return i * 2
  }
  
  for i in result {
    print("结束处理: \(i)")
  }
}
