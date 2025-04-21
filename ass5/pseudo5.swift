// Thanapong Yamkamol
// 67130010168

START

PRINT: 
"ASSIGNMENT 5"
"========================="
"🔢 INPUT 10 INTEGERS 🔢"
"========================="

// กำหนดตัวแปรสำหรับเก็บค่าตัวเลข
SET numbers TO EMPTY LIST // ตัวแปร numbers เก็บค่าข้อมูลด้วย array ประเภท: Int
SET totalCount TO 10 //ให้ตัวแปร totalCount มีค่าเป็น 10 ประเภท: Int
SET count TO 0 //ให้ตัวแปร count มีค่าเป็น 0 ประเภท: Int

// รับค่าตัวเลขจำนวน 10 ค่า ด้วย for-loop
FOR i FROM 1 TO totalCount DO
   PROMPT "➡️ Enter number ", i, ": "
   IF number IS A VALID INTEGER THEN // ตรวจสอบว่าค่าที่รับเป็นตัวเลขหรือไม่
    READ number // รับ input numbers จาก user จำนวน 10 ตัว
    APPEND number TO numbers // ถ้า input ถูกต้องให้ number กลายเป็น numbers
   ELSE
    // input ผิดประเภท
    PRINT "⚠️ Please enter a valid integer! ⚠️"
    CONTINUE // ขอให้ผู้ใช้ป้อนค่าใหม่
   END IF
END FOR

// คำนวณค่าต่างๆ
SET sum TO SUM(numbers) // ผลรวมของตัวเลขทั้งหมด
SET average TO sum / totalCount // ค่าเฉลี่ย
SET minValue TO MIN(numbers) // ค่าต่ำสุด
SET maxValue TO MAX(numbers) // ค่าสูงสุด

// output
PRINT "\n========================"
PRINT "       📊 RESULT 📊"
PRINT "========================"
PRINT "\n🔹 Sum: ", sum
PRINT "🔹 Average: ", FORMAT(average, "#.##")
PRINT "🔹 Minimum Value: ", minValue
PRINT "🔹 Maximum Value: ", maxValue
PRINT "\n========================"

END

