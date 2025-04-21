// Thanapong Yamkamol
// 67130010168

import Foundation

print("ASSIGNMENT 5️⃣\n")
print("=========================")
print("🔢 INPUT 10 INTEGERS 🔢")
print("=========================\n")

var numbers: [Int] = []
let totalCount = 10
var count = 0

// Loop to receive 10 integer inputs from the user
for i in 1...totalCount {
    print("➡️ Enter number \(i):", terminator: " ")
    if let number = Int(readLine() ?? ""){
        numbers.append(number) // Store the valid integer input
    } else {
        print("⚠️ Please enter a valid integer! ⚠️")
        continue // Retry the current iteration
    }
}

// Calculate required values
let sum = numbers.reduce(0, +) // Calculate sum of all numbers
let average = Double(sum) / Double(totalCount) // Compute average value
let minValue = numbers.min() ?? 0 // Find the minimum value
let maxValue = numbers.max() ?? 0 // Find the maximum value

// Display results
print("\n========================")
print("       📊 RESULT 📊")
print("========================")

print("\n🔹 Sum: \(sum)")
print("🔹 Average: \(String(format: "%.2f", average))")
print("🔹 Minimum Value: \(minValue)")
print("🔹 Maximum Value: \(maxValue)")
print("\n========================")
