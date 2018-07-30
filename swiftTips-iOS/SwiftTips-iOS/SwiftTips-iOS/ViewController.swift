//
//  ViewController.swift
//  SwiftTips-iOS
//
//  Created by 季勤强 on 2018/7/30.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import UIKit

typealias Task = (_ cancel: Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping () -> ()) -> Task? {
  
  func dispatch_later(block: @escaping () -> ()) {
    let t = DispatchTime.now() + time
    DispatchQueue.main.asyncAfter(deadline: t, execute: block)
  }
  
  var closure: (() -> Void)? = task
  var result: Task?
  
  let delayedClosure: Task = { cancel in
    if let internalClosure = closure {
      if (cancel == false) {
        DispatchQueue.main.async(execute: internalClosure)
      } else {
        print("cancel...")
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

class ViewController: UIViewController {
  
  lazy var button: UIButton = {
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 44))
    button.backgroundColor = UIColor.red
    button.addTarget(self, action: #selector(click), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(button)
    
//    let _ = delay(2) { print("2秒后输出...") }
//    let task = delay(5.0) { print("拨打110") }
//    cancel(task)
    
    // KVO
    let obj = Class()
    let _ = delay(2) {
      obj.myObject.date = Date()
    }
  }
  
  @objc func click() {
    print("click...")
  }

}

