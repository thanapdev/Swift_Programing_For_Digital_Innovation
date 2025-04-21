// Thanapong Yamkamol
// 67130010168

import Foundation
var equation = 0 // decare variable to count possible equations
var evenEquation = 0 // decare variable to count even equations

print("===================================")
print("🔢       Possible Equations     🔢")
print("===================================\n")

for x in 1...100{ // loop x 1-100
    for y in 10...150{ // loop y 10-150
        for z in 0...50{ // loop z 0-50

            // check for possible equations
            if 5*x - 10*y + 2*z == 40{
                equation += 1
                
                // check for even equations
                if x % 2 == 0 && y % 2 == 0 && z % 2 == 0 { 
                    evenEquation += 1
                }

                // print number that complete equations
                print("✅ x: x | y: y | z: z 🎯")
            }
        }
    }
}

// output 
print("\n ===================================")
print("✅valid equation : \(equation)✅")
print("✅even equation : \(evenEquation)✅")
print("===================================")
