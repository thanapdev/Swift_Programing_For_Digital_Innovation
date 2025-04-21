// Thanapong Yamkamol
// 67130010168

START

// กำหนดฟังก์ yokkamlang
FUNCTION yokkamlang(baseNum, powNum)

    // ถ้าเลขยกกำลังเป็น 0 ให้คืนค่า 1
    IF powNum == 0 THEN
        RETURN 1

    ELSE
        // คูณ baseNum ด้วยผลลัพธ์ของฟังก์ชันด้วย powNum - 1
        RETURN baseNum * yokkamlang(baseNum, powNum - 1)
    END IF

END FUNCTION

// user input เลขฐาน
DISPLAY "Enter base (baseNum): "
READ input from user and STORE it in baseNum

IF baseNum is a valid integer THEN

    // user input เลขยกกำลัง
    DISPLAY "Enter exponent (powNum): "
    READ input from user and STORE it in powNum

    IF powNum is a valid integer THEN

        // Call function มาคำนวณ
        result ← yokkamlang(baseNum, powNum)

        // output
        DISPLAY "baseNum to the power of powNum is result"

    ELSE
        // user input ค่าผิด
        DISPLAY "input number only"
    END IF

ELSE
    // user input ค่าผิด
    DISPLAY "input number only"
END IF

END 

