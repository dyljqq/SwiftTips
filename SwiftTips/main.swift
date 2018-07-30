//
//  main.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation
import Cocoa

//let arr = [1, 2, 3, 4, 5]
//
//for i in ReverseSequence(array: arr) {
//  print(i)
//}
//
//traverse()
//regexTest()
//patternMatch()

//ClassSelf.test()
//typeOfAppleExample()

//DynamicType.print()
//
//noLazy()
//useLazy()

// 多重Optional
//let aNil: String? = nil
//let anotherNil: String?? = aNil // 这个就相当于是盒子里有一个盒子，然后才是nil. debug的结果为: Optional<Optional<String>>, some : nil
//let literalNil: String?? = nil // 这个盒子打开就直接是nil
//
//// 因此以下输出不相等
//if anotherNil != nil {
//  print("another nil...")
//}
//
//// 这个是不输出的
//if literalNil != nil {
//  print("literal nil...")
//}


// Optional Map
//let num: Int? = 3
//let result = num.map { return $0 * 3 } // 涉及到了函子的概念。
//print("result: \(result ?? 0)")

// idirect与enum
//indirect enum LinkedList<Element: Comparable> {
//  case empty
//  case node(Element, LinkedList<Element>)
//}
//
//let list = LinkedList.node(1, .node(2, .node(3, .empty)))
//
//extension LinkedList {
//  func removing(_ element: Element) -> LinkedList {
//    guard case let .node(value, next) = self else { return .empty }
//    return value == element ? next : LinkedList.node(value, next.removing(element))
//  }
//}
//
//let result = list.removing(2)
//print(result)


// 实例方法的动态调用

//class MyClass {
//
//  func method(number: Int) -> Int {
//    print(number)
//    return number + 1
//  }
//
//}
//
//// curry: (MyClass) -> (Int) -> Int
//let f = MyClass.method
//let object = MyClass.init()
//let result = f(object)(1)


// 条件编译

//#if os(macOS)
//  typealias Color = NSColor
//#else
//  typealias Color = UIColor
//#endif
//
//// It's fine to set FREE_VERSION to true during development then when ready to release an app switch it to false
//#if FREE_VERSION
//  print("free version")
//#else
//  print("other")
//#endif


// retain cycle

//class A: NSObject {
//
//  let b: B
//
//  override init() {
//    b = B()
//    super.init()
//    b.a = self
//
//  }
//
//  deinit {
//    print("A deinit")
//  }
//
//}
//
//class B: NSObject {
//  weak var a: A? = nil
//
//  deinit {
//    print("B deinit")
//  }
//}
//
//func test() {
//  var obj: A? = A()
//  obj = nil
//}
//
//test()


// 值类型与引用类型

//func test(_ arr: [Int]) {
//
//  for i in arr {
//    print(i)
//  }
//
//}
//
//var a = [1, 2, 3]
//var b = a
//let c = a
//
//a.withUnsafeBytes { print($0) }
//b.withUnsafeBytes { print($0) }
//
//b.append(5)
//// 此时地址改变，经历了写时复制
//b.withUnsafeBytes { print($0) }
//
//test(a)


// 延迟执行

//let t = delay(2) { print("2秒后输出") }
//t?(false)
//
//let task = delay(5) { print("拨打110") }
//cancel(task)


// 获取对象类型

//let date = NSDate()
////let name: AnyClass! = object_getClass(date)
//let name = type(of: date)
//print(name)


// 随机数生成

//func random(in range: Range<Int>) -> Int {
//  let count = UInt32(range.upperBound - range.lowerBound)
//  return Int(arc4random_uniform(count)) + range.lowerBound
//}
//
//for _ in 0..<10 {
//  let range = Range<Int>(1...6)
//  print(random(in: range))
//}


// print and debugPrint
//struct Meeting {
//  let date: Date
//  let place: String
//  let attendeeName: String
//
//  init() {
//    self.date = Date()
//    self.place = "2141"
//    self.attendeeName = "fafjaj"
//  }
//}
//
//extension Meeting: CustomStringConvertible {
//  var description: String {
//    return "于 \(self.date) 在 \(self.place) 与 \(self.attendeeName) 进行会议"
//  }
//}
//
//print(Meeting())


// 错误和异常处理

enum LoginError: Error {
  case UserNotFound, UserPasswordNotMatch
}

let users = ["user": "123", "password": "123"]

func login(user: String, password: String) throws {
  if !users.keys.contains(user) {
    throw LoginError.UserNotFound
  }
  
  if users[user] != password {
    throw LoginError.UserPasswordNotMatch
  }
  
  print("Login Success.")
}

do {
  try login(user: "123", password: "")
} catch LoginError.UserNotFound {
  print("user not found")
} catch LoginError.UserPasswordNotMatch {
  print("UserPasswordNotMatch")
}
