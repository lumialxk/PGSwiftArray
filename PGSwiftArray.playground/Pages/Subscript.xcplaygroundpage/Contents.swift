/*:
[目录](TableOfContents) | [前一页](@previous) | [后一页](@next)
# Array的下标
`Swift`中对于下标的使用变得灵活，只需实现`subscript`方法即可。如果我们希望使用下标来做更多事情，我们也可以自定义
*/
import Foundation
//: 首先我们创建一个数组用于测试
var array = [1,2,3,4,5,6,7]
/*:
这是Array中原生的两个下标方法
* public subscript (index: Int) -> Element
* public subscript (subRange: Range<Int>) -> ArraySlice<Element>
*/
let element = array[2]
let elements = array[1...3]
//: 如果我们希望可以得到第1，3，5个元素时，就需要我们来自定义下标了
extension Array {
    subscript (indexes: [Int]) -> ArraySlice<Element> {
        get {
            return indexes.reduce(ArraySlice<Element>()) { (var elements, index) -> ArraySlice<Element> in
                elements.append(self[index])
                return elements
            }
        }
        set {
            indexes.forEach { (index) -> () in
                self[index] = newValue[index]
            }
        }
    }
}
//: [目录](TableOfContents) | [前一页](@previous) | [后一页](@next)
