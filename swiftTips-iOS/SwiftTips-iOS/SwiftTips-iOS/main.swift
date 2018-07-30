//
//  main.swift
//  SwiftTips-iOS
//
//  Created by 季勤强 on 2018/7/30.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import UIKit

class MyApplication: UIApplication {
  override func sendEvent(_ event: UIEvent) {
    super.sendEvent(event)
    print("Event sent: \(event)")
  }
}

UIApplicationMain(
  CommandLine.argc,
  UnsafeMutableRawPointer(CommandLine.unsafeArgv)
    .bindMemory(
      to: UnsafeMutablePointer<Int8>.self,
      capacity: Int(CommandLine.argc)),
  NSStringFromClass(MyApplication.self),
  NSStringFromClass(AppDelegate.self)
)
