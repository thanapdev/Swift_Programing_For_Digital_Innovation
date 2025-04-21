// 67130010168
// thanapong yamkamol

import Foundation

// dictionary 
var sData: [String: [String: Float]] = [:]
var sGrade: [String: String] = [:]

// loop menu
repeat {
    print("""
    
    === MENU ===
    1. ป้อนข้อมูลนักเรียน
    2. แก้ไขข้อมูลนักเรียน
    3. แสดงข้อมูลนักเรียนตามคะแนนรวม (มาก -> น้อย)
    4. ค้นหาข้อมูลคะแนนและเกรดตามชื่อ
    5. ออกจากโปรแกรม
    เลือกเมนู (1-5):
    """, terminator: " ")
    
    // variable menu for use choice
    let menu = readLine() ?? ""
    
    // user input 1
    if menu == "1" {
        print("จำนวนนักเรียนที่ต้องการป้อน: ", terminator: "")
        let count = Int(readLine() ?? "") ?? 0
        
        // loop by input sAmount
        for _ in 1...count {
            print("ชื่อนักเรียน: ", terminator: "")
            let sName = readLine() ?? ""
            
            print("คะแนนสอบครั้งที่ 1: ", terminator: "")
            let score1 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 2: ", terminator: "")
            let score2 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 3: ", terminator: "")
            let score3 = Float(readLine() ?? "") ?? 0
            
            let part1 = score1 * 0.25
            let part2 = score2 * 0.25
            let part3 = score3 * 0.50
            let total = part1 + part2 + part3
            
            // grade calculating
            var grade = ""
            if total >= 85 {
                grade = "A"
            } else if total >= 70 {
                grade = "B"
            } else if total >= 55 {
                grade = "C"
            } else if total >= 40 {
                grade = "D"
            } else {
                grade = "E"
            }
            
            // correct data into array
            sData[sName] = [
                "score1": score1,
                "score2": score2,
                "score3": score3,
                "total": total
            ]
            sGrade[sName] = grade
        }
        

    // user input 2
    } else if menu == "2" {
        print("กรอกชื่อนักเรียนที่ต้องการแก้ไข: ", terminator: "")
        let sName = readLine() ?? ""
        
        if sData[sName] != nil {
            print("== แก้ไขข้อมูลของ \(sName) ==")
            
            print("คะแนนสอบครั้งที่ 1: ", terminator: "")
            let score1 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 2: ", terminator: "")
            let score2 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 3: ", terminator: "")
            let score3 = Float(readLine() ?? "") ?? 0
            
            let part1 = score1 * 0.25
            let part2 = score2 * 0.25
            let part3 = score3 * 0.50
            let total = part1 + part2 + part3
            
            // grade calculating
            var grade = ""
            if total >= 85 {
                grade = "A"
            } else if total >= 70 {
                grade = "B"
            } else if total >= 55 {
                grade = "C"
            } else if total >= 40 {
                grade = "D"
            } else {
                grade = "E"
            }
            
            // update data
            sData[sName]?["score1"] = score1
            sData[sName]?["score2"] = score2
            sData[sName]?["score3"] = score3
            sData[sName]?["total"] = total
            sGrade[sName] = grade
            
        } else {
            print("ไม่พบชื่อนักเรียนนี้ในระบบ")
        }
    
    //  user input 3
    } else if menu == "3" {
        print("\n=== รายชื่อนักเรียนเรียงตามคะแนนรวม ===")
        print("No.\tชื่อ\tคะแนน1\tคะแนน2\tคะแนน3\tรวม\tเกรด")
        print("----------------------------------------------------------")
        
        // search by dictionary
        let sorted = sData.sorted {
            ($0.value["total"] ?? 0) > ($1.value["total"] ?? 0)
        }
        
        // loop output
        for (index, entry) in sorted.enumerated() {
            let sName = entry.key
            let scores = entry.value
            let grade = sGrade[sName] ?? "-"
            
            print("\(index + 1)\t\(sName)\t\(scores["score1"] ?? 0)\t\(scores["score2"] ?? 0)\t\(scores["score3"] ?? 0)\t\(String(format: "%.2f", scores["total"] ?? 0))\t\(grade)")
        }
    
    // user input 4
    } else if menu == "4" {
        print("กรอกชื่อนักเรียน: ", terminator: "")
        let sName = readLine() ?? ""
        
        if let scores = sData[sName] {
            let total = scores["total"] ?? 0
            let grade = sGrade[sName] ?? "-"
            
            print("\nข้อมูลของ \(sName):")
            print("คะแนนรวม: \(String(format: "%.2f", total))")
            print("เกรด: \(grade)")
        } else {
            print("ไม่พบข้อมูลนักเรียนชื่อ \(sName)")
        }
        
    } else if menu == "5" {
        print("ออกจากโปรแกรมแล้ว")
        break
        
    } else {
        print("กรุณาเลือกเมนูให้ถูกต้อง (1-5)")
    }
    
} while true
