//: # 05 - Struct vs Class（核心概念）

import Foundation

// ====================
// Struct - 值类型
// ====================

struct Point {
    var x: Double
    var y: Double

    // mutating - 值类型修改自身需要标记
    mutating func moveBy(dx: Double, dy: Double) {
        x += dx
        y += dy
    }
}

var pointA = Point(x: 0, y: 0)
var pointB = pointA  // 复制！
pointB.x = 10

print("pointA: (\(pointA.x), \(pointA.y))")  // (0, 0)
print("pointB: (\(pointB.x), \(pointB.y))")  // (10, 0)

// ====================
// Class - 引用类型
// ====================

class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let personA = Person(name: "Alice", age: 30)
let personB = personA  // 引用！
personB.age = 31

print("personA.age: \(personA.age)")  // 31
print("Same object? \(personA === personB)")  // true

// ====================
// 何时用 Struct vs Class？
// ====================

// Struct：默认选择，表示值，线程安全
// Class：需要继承、身份比较、与 Objective-C 交互

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：创建一个表示颜色的 struct，包含 RGB 值和计算属性 luminance
