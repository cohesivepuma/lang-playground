//: # 02 - 集合类型

import Foundation

// ====================
// 数组（Array）
// ====================

var fruits = ["Apple", "Banana", "Orange"]

// 常用操作
fruits.append("Mango")
fruits.insert("Grape", at: 1)

// 函数式操作（重点）
let upperFruits = fruits.map { $0.uppercased() }
let filtered = fruits.filter { $0.count > 5 }

print("Fruits: \(fruits)")
print("Upper: \(upperFruits)")

// ====================
// 字典（Dictionary）
// ====================

var scores = ["Alice": 85, "Bob": 92]

// 访问（返回 Optional）
let aliceScore = scores["Alice"]

// 安全解包
if let score = scores["Alice"] {
    print("Alice's score: \(score)")
}

// 默认值
let daveScore = scores["Dave", default: 0]

// ====================
// Set - 无序、唯一
// ====================

var setA: Set = [1, 2, 3, 4]
var setB: Set = [3, 4, 5, 6]

let intersection = setA.intersection(setB)
print("交集: \(intersection)")

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：创建一个数字数组，过滤出偶数，然后计算它们的平方
