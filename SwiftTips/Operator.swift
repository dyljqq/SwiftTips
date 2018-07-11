//
//  Operator.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

struct Vector2D {
  
  var x = 0.0
  var y = 0.0
  
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
  return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

func -(left: Vector2D, right: Vector2D) -> Vector2D {
  return Vector2D(x: left.x - right.x, y: left.y - right.y)
}

//func -(value: Vector2D) -> Vector2D {
//  return Vector2D(x: -value.x, y: -value.y)
//}
