// Thanapong Yamkamol
// 67130010168

import Foundation

// Define PI value
let pi = 3.14159265

// Head of the table
print("══════════════════════════════════════════════════════════════════════════════════════════════")
print("🔢 |  Degree  |     Sin    |     Cos    |     Tan    |     Cot    |     Sec    |    Cosec   |")
print("══════════════════════════════════════════════════════════════════════════════════════════════")

// loop x20 
for i in 1...20 {

    let degree = Double(i) * 0.1

    // covert degree to radiant
    let radian = pi * degree / 180.0
    
    // calculate table
    let sinValue = sin(radian)
    let cosValue = cos(radian)
    let tanValue = tan(radian)
    let cotValue = 1.0 / tanValue
    let secValue = 1.0 / cosValue
    let cosecValue = 1.0 / sinValue
    
    // output
    print(String(format: "🌐 |  %6.1f°  |  %8.6f  |  %8.6f  |  %8.6f  |  %8.6f  |  %8.6f  |  %8.6f  |", 
                  degree, sinValue, cosValue, tanValue, cotValue, secValue, cosecValue))
}

print("══════════════════════════════════════════════════════════════════════════════════════════════")
