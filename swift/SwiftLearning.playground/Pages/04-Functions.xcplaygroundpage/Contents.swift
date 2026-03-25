//: # 04 - 函数与闭包

import Foundation

// ====================
// 基础函数
// ====================

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// 参数标签
func greet(person name: String, from city: String) {
    print("\(name) is from \(city)")
}
greet(person: "Alice", from: "Beijing")

// ====================
// 闭包（Closures）
// ====================

let numbers = [5, 2, 8, 1, 9]

// 高阶函数
let doubled = numbers.map { $0 * 2 }
let evens = numbers.filter { $0 % 2 == 0 }
let total = numbers.reduce(0, +)

print("Doubled: \(doubled)")
print("Evens: \(evens)")
print("Total: \(total)")

// 尾随闭包
let sorted = numbers.sorted { $0 < $1 }
print("Sorted: \(sorted)")

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：写一个函数，接受一个字符串数组，返回长度大于5的字符串
