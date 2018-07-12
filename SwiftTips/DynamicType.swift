//
//  DynamicType.swift
//  SwiftTips
//
//  Created by 季勤强 on 2018/7/12.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class Pet {
  required init() {}
}
class Cat: Pet {}
class Dog: Pet {}

func printPet(_ pet: Pet) {
  print("Pet")
}

func printPet(_ cat: Cat) {
  print("Meow")
}

func printPet(_ dog: Dog) {
  print("Bark")
}

struct DynamicType {
  
  static func print() {
    printPet(Pet())
    printPet(Pet())
    printPet(Pet())
    
    printThem(Dog(), Cat())
  }
  
  static func printThem(_ pet: Pet, _ cat: Cat) {
    // 编译时决定，不会改变
    printPet(pet) //pet
    printPet(cat) // meow
    
    if let aCat = pet as? Cat {
      printPet(aCat)
    } else if let aDog = pet as? Dog {
      printPet(aDog)
    } else {
      printPet(pet)
    }
    printPet(cat)
    
    let p = type(of: pet).init()
    printPet(p)
  }
  
}
