// Thanapong Yamkamol
// 67130010168

import Foundation

// declare function
func yokkamlang(baseNum: Int, powNum: Int) -> Int {
    if powNum == 0 {
        return 1
    } else {
        return baseNum * yokkamlang(baseNum: baseNum, powNum: powNum - 1)
    }
}

// input base number
print("input base number: ", terminator: "")
if let baseNum = Int(readLine()!) {
    
    // input exponent number
    print("input exponent number: ", terminator: "")
    if let powNum = Int(readLine()!) {
        
        // call function
        let result = yokkamlang(baseNum: baseNum, powNum: powNum)
        print("\(baseNum) to the power of \(powNum) = \(result)")
        
    } else {
        print("input number only")
    }

} else {
    print("input number only")
}
 