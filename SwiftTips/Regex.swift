//
//  Regex.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/11.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

precedencegroup MatchPrecedence {
  associativity: none
  higherThan: DefaultPrecedence
}

infix operator =~: MatchPrecedence

func =~(lhs: String, rhs: String) -> Bool {
  do {
    return try RegexHelper(rhs).match(lhs)
  } catch {
    return false
  }
}

struct RegexHelper {
  
  let regex: NSRegularExpression
  
  init(_ pattern: String) throws {
    self.regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
  }
  
  func match(_ input: String) -> Bool {
    let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
    return matches.count > 0
  }
  
}

let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

func regexTest() {
  let matcher: RegexHelper
  do {
    matcher = try RegexHelper(mailPattern)
    let maybeMailAddress = "355086587@qq.com"
    if matcher.match(maybeMailAddress) {
      print("有效的邮箱地址")
    }
  } catch {
    print("error...")
  }
  
  if "355086587@qq.com" =~ mailPattern {
    print("有效的邮箱地址")
  }
}
