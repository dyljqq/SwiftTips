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


// 模式匹配

func ~=(pattern: NSRegularExpression, input: String) -> Bool {
  return pattern.numberOfMatches(in: input, options: [], range: NSMakeRange(0, input.count)) > 0
}

prefix operator ~/

prefix func ~/(pattern: String) throws -> NSRegularExpression {
  return try NSRegularExpression(pattern: pattern, options: [])
}

func patternMatch() {
  do {
    let mailRegex =  try ~/"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    let siteRegex = try ~/"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})(\\/\\w\\.-]*)*\\/?$"
    let contact = ("https://google.com", "qinqiangji@gmail.com")
    switch contact {
    case (siteRegex, mailRegex): print("同时有效")
    case (_, mailRegex): print("邮箱有效")
    case (siteRegex, _): print("网址有效")
    default: print("嘛都没有")
    }
  } catch let error as NSError {
    print("parse error: \(error.description)")
  }
}
