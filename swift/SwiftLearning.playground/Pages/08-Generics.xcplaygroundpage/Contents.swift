//: # 08 - 泛型

import Foundation

// ====================
// 泛型函数
// ====================

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a; a = b; b = temp
}

var intA = 3, intB = 5
swapTwoValues(&intA, &intB)
print("intA: \(intA), intB: \(intB)")

// ====================
// 泛型类型
// ====================

struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        items.popLast()
    }
}

var stack = Stack<Int>()
stack.push(10)
stack.push(20)
print(stack.pop() ?? 0)

// ====================
// 泛型约束
// ====================

func findMax<T: Comparable>(_ values: [T]) -> T? {
    guard !values.isEmpty else { return nil }
    return values.max()
}

print(findMax([3, 1, 4, 1, 5]) ?? 0)

// ====================
// 练习
// ====================

print("\n=== 练习区域 ===")
// 练习1：实现一个泛型的 Queue（队列）结构体
