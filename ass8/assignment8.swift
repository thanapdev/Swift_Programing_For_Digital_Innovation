// Thanapong Yamkamol
// 67130010168

import Foundation

// user input a decimal number
print("🔢 Enter a decimal number: ", terminator: "")


var decimal = 0
// read user input and convert it to an integer
if let decimal = Int(readLine() ?? "") {
    var number = decimal // store the input number
    var binary = "" 

    print("\n🧮 Short Division Process")
    print("==========================")

    // calculate by short divide method
   while number > 0 {
        let remainder = number % 2
        print("\(number) ÷ 2  ➝  remainder: \(remainder)") // short division step
        binary = "\(remainder)" + binary // append remainder at the front of the result
        number /= 2 // divide the number by 2
    }

    print("==========================")

    // if result is empty (when input is 0), print "0", otherwise print the binary result
    print("✅ Binary Result: \(binary.isEmpty ? "0" : binary)")
} else {
    // display error message if the input is not a valid integer
    print("❌ Please enter a valid number!")
}
