// Thanapong Yamkamol
// 67130010168

START

// ประกาศอาเรย์ 1 มิติ เก็บชื่อนักเรียน
DECLARE sName AS 1D array of String 

// ประกาศอาเรย์ 2 มิติ เก็บคะแนนนักเรียน (คะแนนดิบ, คะแนนจริง, คะแนนรวม)
DECLARE sScore AS 2D array of Float  

REPEAT
    // แสดงเมนูให้ผู้ใช้เลือกการทำงาน
    DISPLAY """
            === MENU ===
            1. ป้อนข้อมูลนักเรียน
            2. แก้ไขข้อมูลนักเรียน
            3. แสดงข้อมูลนักเรียนตามคะแนนรวม (มาก -> น้อย)
            4. ค้นหาข้อมูลคะแนนและเกรดตามชื่อ
            5. ออกจากโปรแกรม
            กรุณาเลือกเมนู (1-5):
            """, terminator: " "              
            
    PROMPT user for menu 
    READ menu

    // เมนูป้อนข้อมูลนักเรียน
    IF menu == "1" THEN  
        // ตรวจสอบว่าต้องป้อนนักเรียนอย่างน้อย 5 คน                
        DO
            DISPLAY "กรุณาป้อนข้อมูลนักเรียนอย่างน้อย 5 คน: "
            READ sAmount
        WHILE sAmount < 5                

        FOR i FROM 1 TO sAmount DO
            PROMPT "ชื่อนักเรียน: "
            // อ่านชื่อผู้เรียน
            READ sNameInput
            
             // อ่านคะแนนสอบครั้งที่ 1
            PROMPT "คะแนนสอบครั้งที่ 1 (เต็ม 80): "
            READ score1                 

            // อ่านคะแนนสอบครั้งที่ 2
            PROMPT "คะแนนสอบครั้งที่ 2 (เต็ม 60): "
            READ score2                  

            // อ่านคะแนนสอบครั้งที่ 3
            PROMPT "คะแนนสอบครั้งที่ 3 (เต็ม 40): "
            READ score3                  

            COMPUTE part1 = (score1 / 80) * 25  // แปลงคะแนนสอบครั้งที่ 1 เป็นคะแนนจริง
            COMPUTE part2 = (score2 / 60) * 25  // แปลงคะแนนสอบครั้งที่ 2 เป็นคะแนนจริง
            COMPUTE part3 = (score3 / 40) * 50  // แปลงคะแนนสอบครั้งที่ 3 เป็นคะแนนจริง
            COMPUTE total = part1 + part2 + part3 // รวมคะแนนจริง

            // เพิ่มชื่อไปยังอาเรย์ sName
            APPEND sNameInput TO sName

            // เพิ่มคะแนนไปยัง sScore              
            APPEND [score1, score2, score3, part1, part2, part3, total] TO sScore   
        END FOR

    // เมนูแก้ไขข้อมูลนักเรียน
    ELSE IF menu == "2" THEN            
        PROMPT "กรอกชื่อนักเรียนที่ต้องการแก้ไข: "
        READ sNameInput

        IF sNameInput EXISTS IN sName THEN
            FIND index of sNameInput

            PROMPT and READ new score1, score2, score3
            COMPUTE part1, part2, part3, total as above

            UPDATE sScore[index] WITH new values
        ELSE
            DISPLAY "ไม่พบชื่อนักเรียนนี้"
        END IF

    ELSE IF menu == "3" THEN
        // เมนูแสดงข้อมูลเรียงตามคะแนนรวม            
        SORT (sName, sScore) pairs BY total DESCENDING

        FOR EACH student DO
            // ตัดเกรดจากคะแนนรวม
            COMPUTE grade FROM total     
            DISPLAY name, scores, real scores, total, and grade
        END FOR

    ELSE IF menu == "4" THEN
        // เมนูค้นหาข้อมูลนักเรียน            
        PROMPT "กรอกชื่อนักเรียน: "
        READ sNameInput

        IF sNameInput EXISTS IN sName THEN
            GET index
            RETRIEVE scores FROM sScore[index]
            COMPUTE grade FROM total
            DISPLAY raw scores, real scores, total, and grade
        ELSE
            DISPLAY "ไม่พบข้อมูลนักเรียนชื่อ"
        END IF

    ELSE IF menu == "5" THEN  
        // เมนูออกจากโปรแกรม          
        DISPLAY "ออกจากโปรแกรมแล้ว"
        BREAK LOOP

    ELSE
        DISPLAY "กรุณาเลือกเมนู 1-5 ให้ถูกต้อง"
    END IF

UNTIL menu == "5"

END

