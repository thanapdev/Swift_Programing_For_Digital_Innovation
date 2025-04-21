// Thanapong Yamkamol
// 67130010168

import Foundation

// สร้าง Dictionary เพื่อเก็บข้อมูลคะแนนของนักเรียน
var sData: [String: [String: Float]] = [:]

// สร้าง Dictionary เพื่อเก็บเกรดของนักเรียน
var sGrade: [String: String] = [:]

// เริ่ม loop เพื่อแสดงเมนูซ้ำจนกว่าจะเลือกออกจากโปรแกรม
repeat {
    // แสดงเมนูให้ผู้ใช้เลือก
    print("""
    
    === MENU ===
    1. ป้อนข้อมูลนักเรียน
    2. แก้ไขข้อมูลนักเรียน
    3. แสดงข้อมูลนักเรียนตามคะแนนรวม (มาก -> น้อย)
    4. ค้นหาข้อมูลคะแนนและเกรดตามชื่อ
    5. ออกจากโปรแกรม
    กรุณาเลือกเมนู (1-5):
    """, terminator: " ")
    
    // อ่านเมนูที่ผู้ใช้เลือก
    let menu = readLine() ?? ""
    
    // เมนูที่ 1: ป้อนข้อมูลนักเรียนใหม่
    if menu == "1" {
        print("จำนวนที่ต้องการป้อน: ", terminator: "")
        let count = Int(readLine() ?? "") ?? 0
        
        // รับข้อมูลตามจำนวนที่ป้อน
        for _ in 1...count {
            print("ชื่อนักเรียน: ", terminator: "")
            let sName = readLine() ?? ""
            
            print("คะแนนสอบครั้งที่ 1: ", terminator: "")
            let score1 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 2: ", terminator: "")
            let score2 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 3: ", terminator: "")
            let score3 = Float(readLine() ?? "") ?? 0
            
            // คำนวณคะแนนรวมตามน้ำหนัก: 25%, 25%, 50%
            let part1 = score1 * 0.25
            let part2 = score2 * 0.25
            let part3 = score3 * 0.50
            let total = part1 + part2 + part3
            
            // คำนวณเกรดจากคะแนนรวม
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
            
            // บันทึกข้อมูลนักเรียนใน Dictionary
            sData[sName] = [
                "score1": score1,
                "score2": score2,
                "score3": score3,
                "total": total
            ]
            sGrade[sName] = grade
        }
        
    }
    
    // เมนูที่ 2: แก้ไขข้อมูลของนักเรียน
    else if menu == "2" {
        print("กรอกชื่อนักเรียนที่ต้องการแก้ไข: ", terminator: "")
        let sName = readLine() ?? ""
        
        // ตรวจสอบว่าชื่อนักเรียนมีในระบบหรือไม่
        if sData[sName] != nil {
            print("== แก้ไขข้อมูลของ \(sName) ==")
            
            // รับคะแนนใหม่
            print("คะแนนสอบครั้งที่ 1: ", terminator: "")
            let score1 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 2: ", terminator: "")
            let score2 = Float(readLine() ?? "") ?? 0
            
            print("คะแนนสอบครั้งที่ 3: ", terminator: "")
            let score3 = Float(readLine() ?? "") ?? 0
            
            // คำนวณคะแนนรวมใหม่
            let part1 = score1 * 0.25
            let part2 = score2 * 0.25
            let part3 = score3 * 0.50
            let total = part1 + part2 + part3
            
            // คำนวณเกรดใหม่
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
            
            // อัปเดตข้อมูล
            sData[sName]?["score1"] = score1
            sData[sName]?["score2"] = score2
            sData[sName]?["score3"] = score3
            sData[sName]?["total"] = total
            sGrade[sName] = grade
            
        } else {
            print("ไม่พบชื่อนักเรียนนี้ในระบบ")
        }
        
    }
    
    // เมนูที่ 3: แสดงข้อมูลเรียงตามคะแนนรวม
    else if menu == "3" {
        print("\n=== รายชื่อนักเรียนเรียงตามคะแนนรวม ===")
        print("No.\tชื่อ\tคะแนน1\tคะแนน2\tคะแนน3\tรวม\tเกรด")
        print("----------------------------------------------------------")
        
        // เรียงข้อมูลตามคะแนนรวมจากมากไปน้อย
        let sorted = sData.sorted {
            ($0.value["total"] ?? 0) > ($1.value["total"] ?? 0)
        }
        
        // แสดงผลลัพธ์แบบตาราง
        for (index, entry) in sorted.enumerated() {
            let sName = entry.key
            let scores = entry.value
            let grade = sGrade[sName] ?? "-"
            
            print("\(index + 1)\t\(sName)\t\(scores["score1"] ?? 0)\t\(scores["score2"] ?? 0)\t\(scores["score3"] ?? 0)\t\(String(format: "%.2f", scores["total"] ?? 0))\t\(grade)")
        }
        
    }
    
    // เมนูที่ 4: ค้นหาข้อมูลโดยใช้ชื่อ
    else if menu == "4" {
        print("กรอกชื่อนักเรียน: ", terminator: "")
        let sName = readLine() ?? ""
        
        // ถ้ามีชื่อนักเรียน แสดงคะแนนรวมและเกรด
        if let scores = sData[sName] {
            let total = scores["total"] ?? 0
            let grade = sGrade[sName] ?? "-"
            
            print("\nข้อมูลของ \(sName):")
            print("คะแนนรวม: \(String(format: "%.2f", total))")
            print("เกรด: \(grade)")
        } else {
            print("ไม่พบข้อมูลนักเรียนชื่อ \(sName)")
        }
        
    }
    
    // เมนูที่ 5: ออกจากโปรแกรม
    else if menu == "5" {
        print("ออกจากโปรแกรมแล้ว")
        break // จบ loop และออกจากโปรแกรม
    }
    
    // ถ้าเลือกเมนูผิด
    else {
        print("กรุณาเลือกเมนูให้ถูกต้อง (1-5)")
    }
    
} while true // ทำซ้ำจนกว่าจะเจอคำสั่ง break
