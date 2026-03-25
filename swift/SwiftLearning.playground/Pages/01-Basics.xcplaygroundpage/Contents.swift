//: # 01 - 基础语法速览

import Foundation

// ====================
// 变量与常量
// ====================

// var - 可变变量
var name = "Swift"
name = "SwiftUI"

// let - 常量（首选，默认用它，需要改再用 var）
let version = 5.9
// version = 6.0  // ❌ 错误：常量不能修改

// ====================
// 类型标注（Swift 会类型推断，但你可以显式声明）
// ====================

let explicitString: String = "Hello"
let explicitInt: Int = 42
let explicitDouble: Double = 3.14159
let explicitBool: Bool = true
 
// ====================
// 字符串插值
// ====================

let greeting = "Hello, \(name) version \(version)!"
print(greeting)

// 多行字符串
let multiline = """
    Swift 是类型安全的语言。
    编译时就能发现很多错误。
    """
print(multiline)

// ====================
// 基本类型
// ====================

// 类型转换需要显式进行
let pi = 3.14
let piInt = Int(pi)  // 3，直接截断小数

// ====================
// 元组（Tuple）
// ====================

let httpStatus = (code: 200, message: "OK")
print("Status: \(httpStatus.code), \(httpStatus.message)")

// 解构
let (code, msg) = httpStatus
print("Status: \(code), \(msg)")
//解构可以使解构更加清晰

// ====================
// 区间（Range）
// ====================

let closedRange = 1...5      // 1,2,3,4,5
let halfOpen = 1..<5         // 1,2,3,4

// ====================
// 练习
// ====================

// 练习1：创建一个包含姓名、年龄、城市的元组，并用字符串插值打印

print("\n=== 练习区域 ===")
// 在这里写你的代码

let person = (name:"steve",age:21,city:"nanjin")
let (n,a,c) = person
print("name：\(n),age：\(a),city：\(c)")

