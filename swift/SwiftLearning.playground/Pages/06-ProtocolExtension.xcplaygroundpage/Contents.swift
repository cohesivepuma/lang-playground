//: # 06 - Protocol 与 Extension（核心）

import Foundation

// ====================
// Protocol - 定义接口
// ====================

protocol Greetable {
    var name: String { get }
    func greet()
}

// 默认实现
extension Greetable {
    func greet() {
        print("Hello, I'm \(name)")
    }
}

// 采用协议
struct User: Greetable {
    let name: String
    // 使用默认实现
}

class Employee: Greetable {
    let name: String
    init(name: String) { self.name = name }

    func greet() {
        print("Hi, I'm \(name)")
    }
}

let user = User(name: "Alice")
user.greet()

let employee = Employee(name: "Bob")
employee.greet()

// ====================
// Extension - 扩展已有类型
// ====================

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self { action() }
    }
}

3.times { print("Hi!") }

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：给 Array 添加扩展，实现 safeSubscript（越界返回 nil）
