// Thanapong Yamkamol
// 67130010168

import Foundation

print("===========================")
print("    character matches")
print("===========================")

print("✅ Enter first string: ", terminator: "")
let firstString = readLine() ?? ""

print("✅ Enter second string: ", terminator: "")
let secondString = readLine() ?? ""

var commonLetters = ""  // correct intersection char

// loop string in firstString
for i in firstString {
    var found = false  // check char that already checked
    
    // loop string in secondString
    for j in secondString {
        if i == j {
            // loop check `i` is in commonLetters 
            found = false
            for k in commonLetters {
                if k == i {
                    found = true  // if already
                    break
                }
            }
            if !found {
                commonLetters += String(i)  // add intersec
            }
            break  // out loop
        }
    }
}

if commonLetters.isEmpty {
    print("No intersection characters found.")
} else {
    print("✅ intersection characters: \(commonLetters) ✅")
}
