// Thanapong Yamkamol
// 67130010168

import Foundation

// user input monthly deposit amount
print("\n💰 Input the money to deposit for your happy next 5 year 💰: ", terminator: "")
guard let monthlyDeposit = Double(readLine() ?? "0"), monthlyDeposit > 0 else {
    print("❌ Invalid input. Please enter a valid number.")
    exit(1)
}

// variable
let interestRate: Double = 5.25 / 100 // interest rate (5.25%)
let totalYears = 5 // deposit period (5 years)
let months = 12 // months per year

var totalBalance: Double = 0 // total balance
var totalInterest: Double = 0 // total interest earned
var year = 1

// loop through each year to calculate
while year <= totalYears {
    var yearlyInterest: Double = 0 // set starting year
    var month = 0 // set starting month
    
    // loop through each month to calculate
    while month < months {
        let interest = (totalBalance + monthlyDeposit) * (interestRate / Double(months)) // Monthly interest calculation
        yearlyInterest += interest // yearly interest
        totalBalance += monthlyDeposit + interest // Update total balance
        month += 1
    }

    totalInterest += yearlyInterest // total interest

    // yearly output
    print("📆 Year \(year):")
    print("   💵 Total Balance: \(String(format: "%.2f", totalBalance)) THB")
    print("   💰 Interest Earned This Year: \(String(format: "%.2f", yearlyInterest)) THB")
    print("   🔹 Total Interest: \(String(format: "%.2f", totalInterest)) THB\n")
    year += 1
}

// summary output
print("🎉 After \(totalYears) years of saving, you've 💰 \(String(format: "%.2f", totalBalance)) THB! 🎉")
print("✨ Total Interest Earned: \(String(format: "%.2f", totalInterest)) THB! ✨")
