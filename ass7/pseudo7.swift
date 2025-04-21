// Thanapong Yamkamol
// 67130010168

START

// กำหนดแถวให้พีระมิด
SET rows = 9

// loop สำหรับแถวของพีระมิด
FOR i FROM 1 TO rows

    // ปริ้นช่องว่างจากยอดถึงฐานพีระมิด
    SET spaces = (rows - i) spaces
    PRINT spaces
    
    // loop ปริ้นตัวเลขจาก 1 ถึง i
    FOR j FROM 1 TO i
        PRINT j
    END FOR
    
    // loop ปริ้นเลขลดลงมาเรื่อย ๆ จาก i-1 ถึง 1
    FOR j FROM (i-1) DOWN TO 1
        PRINT j
    END FOR
    
    // ขึ้นแถวใหม่
    PRINT newline
END FOR