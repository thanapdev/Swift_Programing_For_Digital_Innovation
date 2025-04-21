// 67130010168
// thanapong yamkamol

import Foundation

// dictionary 
var sName: [String] = []
var sScore: [[Float]] = []

// loop menu
repeat {
    print("""
    
    === MENU ===
    1. ป้อนข้อมูลนักเรียน
    2. แก้ไขข้อมูลนักเรียน
    3. แสดงข้อมูลเรียงตามคะแนนรวม
    4. ค้นหาข้อมูลคะแนนและเกรดตามชื่อ
    5. ออกจากโปรแกรม
    เลือกเมนู (1-5):
    """, terminator: " ")

     // variable menu for use choice   
    let menu = readLine() ?? ""
    
    // user input 1
    if menu == "1" {

        // input atleast 5 ppl 
        var sAmount = 0
        repeat {
            print("กรุณาป้อนข้อมูลนักเรียนอย่างน้อย 5 คน")
            print("จำนวนที่ต้องการป้อน: ", terminator: "")
            sAmount = Int(readLine() ?? "") ?? 0
            if sAmount < 5 {
                print("ต้องมากกว่า 5 คนขึ้นไป!\n")
            }
        } while sAmount < 5
        
        // loop by input sAmount
        for i in 1...sAmount {
            print("\nนักเรียนคนที่ \(i)")
            print("ชื่อนักเรียน: ", terminator: "")
            let sNameInput = readLine() ?? ""
            
            // input raw score 
            print("คะแนนสอบครั้งที่ 1 (เต็ม 80): ", terminator: "")
            let score1 = Float(readLine() ?? "") ?? 0
            print("คะแนนสอบครั้งที่ 2 (เต็ม 60): ", terminator: "")
            let score2 = Float(readLine() ?? "") ?? 0
            print("คะแนนสอบครั้งที่ 3 (เต็ม 40): ", terminator: "")
            let score3 = Float(readLine() ?? "") ?? 0
            
            // transform to real score
            let part1 = (score1 / 80) * 25
            let part2 = (score2 / 60) * 25
            let part3 = (score3 / 40) * 50
            let total = part1 + part2 + part3
            
            //correct into total
            sName.append(sNameInput)
            sScore.append([score1, score2, score3, part1, part2, part3, total])
        }
        
    // user input 2
    } else if menu == "2" {
        print("กรอกชื่อนักเรียนที่ต้องการแก้ไข: ", terminator: "")
        let sNameInput = readLine() ?? ""
        if let index = sName.firstIndex(of: sNameInput) {
            print("== แก้ไขข้อมูลของ \(sNameInput) ==")
            print("คะแนนสอบครั้งที่ 1 (เต็ม 80): ", terminator: "")
            let score1 = Float(readLine() ?? "") ?? 0
            print("คะแนนสอบครั้งที่ 2 (เต็ม 60): ", terminator: "")
            let score2 = Float(readLine() ?? "") ?? 0
            print("คะแนนสอบครั้งที่ 3 (เต็ม 40): ", terminator: "")
            let score3 = Float(readLine() ?? "") ?? 0
            
            let part1 = (score1 / 80) * 25
            let part2 = (score2 / 60) * 25
            let part3 = (score3 / 40) * 50
            let total = part1 + part2 + part3
            
            sScore[index] = [score1, score2, score3, part1, part2, part3, total]
        } else {
            print("ไม่พบชื่อนักเรียนนี้")
        }
        
    // user input 3
    } else if menu == "3" {
        print("\n=== ข้อมูลเรียงตามคะแนนรวม (มาก → น้อย) ===")
        print("No.\tชื่อ\tคะแนน1(ดิบ/จริง)\tคะแนน2(ดิบ/จริง)\tคะแนน3(ดิบ/จริง)\tรวม\tเกรด")
        print("-----------------------------------------------------------------------------------")
        
        // search by dictionary
        let sorted = zip(sName, sScore).sorted { $0.1[6] > $1.1[6] }
        
        // loop output
        var i = 1
        for entry in sorted {
            let sNameInput = entry.0
            let s = entry.1
            var grade = ""
            if s[6] >= 85 { grade = "A" }
            else if s[6] >= 70 { grade = "B" }
            else if s[6] >= 55 { grade = "C" }
            else if s[6] >= 40 { grade = "D" }
            else { grade = "E" }
            
            print("\(i)\t\(sNameInput)\t\(s[0])/\(String(format: "%.2f", s[3]))\t\t\(s[1])/\(String(format: "%.2f", s[4]))\t\t\(s[2])/\(String(format: "%.2f", s[5]))\t\t\(String(format: "%.2f", s[6]))\t\(grade)")
            i += 1
        }
        
    // user input 4
    } else if menu == "4" {
        print("กรอกชื่อนักเรียน: ", terminator: "")
        let sNameInput = readLine() ?? ""
        if let index = sName.firstIndex(of: sNameInput) {
            let s = sScore[index]
            var grade = ""
            if s[6] >= 85 { grade = "A" }
            else if s[6] >= 70 { grade = "B" }
            else if s[6] >= 55 { grade = "C" }
            else if s[6] >= 40 { grade = "D" }
            else { grade = "E" }
            
            print("\nข้อมูลของ \(sNameInput):")
            print("คะแนนสอบครั้งที่ 1: \(s[0]) → \(String(format: "%.2f", s[3]))")
            print("คะแนนสอบครั้งที่ 2: \(s[1]) → \(String(format: "%.2f", s[4]))")
            print("คะแนนสอบครั้งที่ 3: \(s[2]) → \(String(format: "%.2f", s[5]))")
            print("คะแนนรวม: \(String(format: "%.2f", s[6]))")
            print("เกรด: \(grade)")
        } else {
            print("ไม่พบข้อมูลนักเรียนชื่อ \(sNameInput)")
        }
        
    } else if menu == "5" {
        print("ออกจากโปรแกรมแล้ว")
        break
        
    } else {
        print("กรุณาเลือกเมนู 1-5 ให้ถูกต้อง")
    }
    
} while true
