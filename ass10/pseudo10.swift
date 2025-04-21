// Thanapong Yamkamol
// 67130010168

START
    PRINT:
    "==========================="
    "    character matches"
    "==========================="

    PRINT "✅ Enter first string: "
    READ firstString

    PRINT "✅ Enter second string: "
    READ secondString

    SET commonLetters = ""  // ตัวอักษรที่ซ้ำกัน

    // วนลูปทุกตัวอักษรใน firstString
    FOR EACH character i IN firstString DO
        SET found = false  // ใช้เช็คว่าตัวอักษรนี้เคยถูกเพิ่มไปแล้วหรือไม่
        
        // วนลูปทุกตัวอักษรใน secondString
        FOR EACH character j IN secondString DO
            IF i == j THEN
                // เช็ค i มีอยู่ใน commonLetters แล้วหรือยัง
                SET found = false
                FOR EACH character k IN commonLetters DO
                    IF k == i THEN
                        SET found = true  // ถ้ามีแล้ว ไม่ต้องเพิ่มซ้ำ
                        BREAK
                    END IF
                END FOR
                
                IF found == false THEN
                    APPEND i TO commonLetters  // เพิ่มตัวอักษรที่ซ้ำกันเข้าไป
                END IF
                
                BREAK  // ออกจากลูป secondString ทันทีเมื่อเจอตัวที่ซ้ำกัน
            END IF
        END FOR
    END FOR

    // output
    IF commonLetters IS EMPTY THEN
        PRINT "No intersection characters found."
    ELSE
        PRINT "✅intersection characters: " + commonLetters✅
    END IF
END
