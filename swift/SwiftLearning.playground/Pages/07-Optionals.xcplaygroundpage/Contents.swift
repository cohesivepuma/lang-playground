//: # 07 - Optionals（安全核心）

import Foundation

// ====================
// Optional 表示"可能有值，也可能为 nil"
// ====================

var optionalNumber: Int? = 42
optionalNumber = nil

// ====================
// 解包方式 1: if let
// ====================

func printDouble(_ number: Int?) {
    if let value = number {
        print("Double is \(value * 2)")
    } else {
        print("No value")
    }
}

printDouble(21)
printDouble(nil)

// ====================
// 解包方式 2: guard let（提前返回）
// ====================

func calculateSqrt(of number: Double?) -> Double? {
    guard let value = number, value >= 0 else {
        return nil
    }
    return sqrt(value)
}

// ====================
// 解包方式 3: ?? 默认值
// ====================

let input: String? = nil
let name = input ?? "Anonymous"
print("Hello, \(name)")

// ====================
// 解包方式 4: Optional Chaining（?.）
// ====================

struct Address {
    var city: String
}
struct Person {
    var address: Address?
}

let person: Person? = Person(address: Address(city: "NYC"))
let city = person?.address?.city
print("City: \(city ?? "Unknown")")

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：写一个函数安全地将字符串转为 Int，失败返回 0
