/*:
[目录](TableOfContents) | [前一页](@previous) | [后一页](@next)
# Array的常用函数
Array相比NSArray一个极大的优点就是使用了更加强大的函数
*/
import Foundation
//: 首先我们创建一个数组用于测试
var array = [1,2,3,4,5,6,7]
//: `filter`函数：用于筛选数组，返回筛选后的函数
array.filter { (element) -> Bool in
    return element > 3
}
//: 值得一提的是在`Swift`中有强大的类型推断，以及有以$0,$1...简写参数的形式
array.filter{$0 > 3}
//: `reduce`函数：用于遍历数组，它需要接受一个初始值，再将其经所有遍历后返回
array.reduce(0) { (total, element) -> Int in
    return total + element
}
//: 同样可以将其简化
array.reduce(0) { $0 + $1 }
//: forEach函数：当我们对数组遍历却无需返回值时使用
array.forEach { (element) -> () in
    print(element)
}
//: split函数：用于分割数组
let splittedArray = array.split { (element) -> Bool in
    element == 3 || element == 6
}
//: map函数：将数组映射成新数组并返回
array.map { (element) -> String in
    return "\(element)"
}
//: flatMap函数：与map略有不同,它会自动忽略为nil的返回值。另外如果返回值是数组，会将其中元素取出
array.flatMap { (element) -> String? in
    return element == 3 ? nil : "\(element)"
}
//: 比较map，flatmap对数组型返回值的处理不同
array.map { (element) -> [String] in
    return ["\(element)"]
}
array.flatMap { (element) -> [String] in
    return ["\(element)"]
}
//: [目录](TableOfContents) | [前一页](@previous) | [后一页](@next)
