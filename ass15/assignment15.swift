// Thanapong Yamkamol
// 67130010168

import Foundation

// declare function
func readInt(prompt: String) -> Int {
    print(prompt, terminator: " ")
    if let number = Int(readLine()!) {
        return number
    } else {
        return 0 // if input is invalid return 0
    }
}

// function to division by using subtraction
func divideBySubtract(base: Int, divisor: Int) -> [Int] {
    var result = 0
    var remainder = base

    if divisor == 0 {
        // cannot division by zero 
        print("Cannot divide by zero!")
        return [0, 0]
    } else if base == 0 {
        return [0, 0]
    } else if base < divisor {
        return [0, base]
    } else {
        while remainder >= divisor {
            remainder -= divisor
            result += 1
        }
        return [result, remainder]
    }
}

// user input base number
let baseNum = readInt(prompt: "Enter base number:")

// user input divisor number
let divisorNum = readInt(prompt: "Enter divisor number:")

// call divideBySubtract
let resultArray = divideBySubtract(base: baseNum, divisor: divisorNum)

// output
if divisorNum != 0 {
    print("\(baseNum) divide \(divisorNum) = \(resultArray[0]) remainder: \(resultArray[1])")
}

