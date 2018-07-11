//
//  Tuple.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

// 普通的交换输入

func swapInput<T>(_ a: inout T, _ b: inout T) {
  let tmp = a
  a = b
  b = tmp
}

// 使用Tuple
func swapInput2<T>(_ a: inout T, _ b: inout T) {
  (a, b) = (b, a)
}
