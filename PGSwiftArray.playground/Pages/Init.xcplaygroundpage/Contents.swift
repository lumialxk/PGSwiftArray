/*:
[目录](TableOfContents) | [前一页](@previous) | [后一页](@next)
# Array的初始化
*/
import Foundation

//: 声明一个只有类型的数组
let array1 = Array<Int>()
//: 声明包含一个元素(数组类型自动推断)的数组
let array2 = Array(arrayLiteral: 1)
//: 声明一个含有若干重复元素的数组
let array3 = Array(count: 5, repeatedValue: "")
//: 我们从数组下标取范围时得到的是ArraySlice类型，我们也可以以此来初始化
let array4 = Array(ArraySlice<Int>())
let array5 = Array(array3[0...2])
let array6 = Array(ArraySlice(count: 5, repeatedValue: 2))

//: 使用SequenceType创建一个数组
struct MyGenerator: GeneratorType {
    typealias Element = Int
    var value: Element
    init(array: Array<Any>) {
        value = array.count-1
    }
    mutating func next() -> MyGenerator.Element? {
        return value < 0 ? nil : value--
    }
}

struct MySequence: SequenceType {
    typealias Generator = MyGenerator
    var array: Array<Any>
    func generate() -> MySequence.Generator {
        return MyGenerator(array: array)
    }
}
let array7 = Array(MySequence(array: [1,2,3,4,5,6]))

//: [目录](TableOfContents) | [前一页](@previous) | [后一页](@next)
