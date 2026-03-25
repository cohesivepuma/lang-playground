//: # 03 - 控制流

import Foundation

// ====================
// if / else
// ====================

let temperature = 25

if temperature > 30 {
    print("It's hot")
} else if temperature > 20 {
    print("It's warm")
} else {
    print("It's cool")
}

// ====================
// guard - 提前返回模式（非常常用）
// ====================

func processUser(name: String?, age: Int?) {
    guard let userName = name, !userName.isEmpty else {
        print("Invalid name")
        return
    }
    print("Processing \(userName)")
}

processUser(name: "Alice", age: 30)
processUser(name: nil, age: 30)

// ====================
// switch - 比 C/JS 更强大
// ====================

let score = 85

switch score {
case 90...100:
    print("A")
case 80..<90:
    print("B")
case 70..<80:
    print("C")
default:
    print("D or F")
}

// ====================
// for 循环
// ====================

let fruits = ["Apple", "Banana", "Orange"]

for (index, fruit) in fruits.enumerated() {
    print("\(index): \(fruit)")
}

// forEach
fruits.forEach { print("→ \($0)") }

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：用 switch 判断一个点是哪个象限
