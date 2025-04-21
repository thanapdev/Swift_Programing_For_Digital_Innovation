// Thanapong Yamkamol
// 67130010168

START

// user input decimal number
PRINT "🔢 Enter a decimal number: "

SET decimal TO 0 // variable เก็บค่าจำนวนเต็มจาก user
SET binary TO "" // variable เก็บผลลัพธ์เป็นเลขฐาน 2

PROMPT "➡️ Enter a decimal number: "  
READ user_input
// รับ input จาก user

// ตรวจสอบว่า input เป็นตัวเลขหรือไม่
IF user_input IS A VALID INTEGER THEN
    SET decimal TO user_input
    SET number TO decimal // เก็บค่าที่ได้ใน variable number ไว้ใช้งาน

    PRINT "\n🧮 Short Division Process"
    PRINT "=========================="

    // ใช้วิธีหารสั้นเพื่อแปลงเลขฐาน 10 เป็นฐาน 2
    WHILE number > 0 DO
        SET remainder TO number MOD 2 // หาเศษจากการหารด้วย 2
        PRINT number, " ÷ 2 ➝ remainder: ", remainder
        SET binary TO remainder + binary // นำเศษมาต่อหน้า output
        SET number TO number DIV 2 // หารเลขด้วย 2

    END WHILE

    PRINT "=========================="

    // output เลขฐาน 2 (ถ้าเป็น 0 ให้แสดง "0")
    PRINT "✅ Binary Result: ", (IF binary IS EMPTY THEN "0" ELSE binary)

ELSE
    // ถ้า user input ที่ไม่ใช้ตัวเลข
    PRINT "❌ Please enter a valid number!"
END IF

END
