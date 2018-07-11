//
//  AutoClosure.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

func &&(_ t: Bool, _ defaultValue: @autoclosure () -> Bool) -> Bool {
  if t {
    return defaultValue()
  }
  return false
}

func ||(_ t: Bool, _ defaultValue: @autoclosure () -> Bool) -> Bool {
  if !t {
    return defaultValue()
  }
  return true
}
