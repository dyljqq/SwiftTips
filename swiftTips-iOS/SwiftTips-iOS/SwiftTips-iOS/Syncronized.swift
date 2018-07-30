//
//  Syncronized.swift
//  SwiftTips-iOS
//
//  Created by 季勤强 on 2018/7/30.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

func synchronized(_ lock: AnyObject, closure: () -> ()) {
  objc_sync_enter(lock)
  closure()
  objc_sync_exit(lock)
}

class Obj {
  
  var _str = "123"
  
  // 线程安全
  var str: String {
    
    get {
      return _str
    }
    
    set {
      synchronized(self) {
        _str = newValue
      }
    }
    
  }
  
}
