import Foundation

//MARK: Reading - Curry Concept
//Currying is the technique of translating the evaluation of a function that takes multiple arguments into evaluating a sequence of functions, each with a single argument

typealias transformation = ((Int) -> Int) // Transforms A into B

func add(_ a: Int) -> transformation { // Returns B when added A to it
    return { b in a + b }
}
// works with any function that matches the type (A, B) -> C
func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> (C) {
    return { a in { b in f(a, b) } }
}

let addTwo = add(2)
let xRange = 1...10

let printingX = xRange.map(addTwo) //Apply addTwo to every element of xRange
print(printingX)

func getSumOf(array:[Int], handler: ((Int)->Void)) {
    //step 2
    var sum: Int = 0
    for value in array {
        sum += value
    }
    
    //step 3
    handler(sum)
}

extension NSNumber {
     func add(_ firstNumber: NSNumber,_ secondNumber: NSNumber) -> NSNumber {
        let a = NSDecimalNumber(decimal: firstNumber as! Decimal)
        let b = NSDecimalNumber(decimal: secondNumber as! Decimal)
        return a.adding(b)
    }
}

func multiplyByTwo(array: [Int]) -> [Int] {
    return array.filter{ $0 % 2 == 0 }.map{ $0 * 2 }
}

print(multiplyByTwo(array: [2,3,5,6]))
