//
//  main.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

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
indirect enum LinkedList<Element: Comparable> {
  case empty
  case node(Element, LinkedList<Element>)
}

let list = LinkedList.node(1, .node(2, .node(3, .empty)))

extension LinkedList {
  func removing(_ element: Element) -> LinkedList {
    guard case let .node(value, next) = self else { return .empty }
    return value == element ? next : LinkedList.node(value, next.removing(element))
  }
}

let result = list.removing(2)
print(result)
