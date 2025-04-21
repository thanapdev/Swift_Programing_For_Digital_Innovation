import Foundation

let rows = 9 // Define the number of rows for the pyramid

for i in 1...rows {
    // Print leading spaces to align numbers in pyramid shape
    let spaces = String(repeating: " ", count: rows - i)
    print(spaces, terminator: "")
    
    // Print numbers in increasing order from 1 to i
    for j in 1...i {
        print(j, terminator: "")
    }
    
    // Print numbers in decreasing order from (i-1) to 1
    for j in stride(from: i-1, through: 1, by: -1) {
        print(j, terminator: "")
    }
    
    print() // Move to the next line
}
