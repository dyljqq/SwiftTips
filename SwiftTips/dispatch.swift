//
//  dispatch.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/30.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

typealias Task = (_ cancel: Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping () -> ()) -> Task? {

  func dispatch_later(block: @escaping () -> ()) {
    let t = DispatchTime.now() + 0.1
    DispatchQueue.main.asyncAfter(deadline: t, execute: block)
  }

  var closure: (() -> Void)? = task
  var result: Task?

  let delayedClosure: Task = { cancel in
    if let internalClosure = closure {
      if !cancel {
        DispatchQueue.main.async(execute: internalClosure)
      }
    }
    closure = nil
    result = nil
  }

  result = delayedClosure

  dispatch_later {
    if let delayedClosure = result {
      delayedClosure(false)
    }
  }

  return result
}

func cancel(_ task: Task?) {
  task?(true)
}
