// Thanapong Yamkamol
// 67130010168

// กำหนดค่า pi
SET pi = 3.14159265

// Print หัวตาราง
PRINT:
    ══════════════════════════════════════════════════════════════════════════════════════════════
    🔢 |  Degree  |     Sin    |     Cos    |     Tan    |     Cot    |     Sec    |    Cosec   |
    ══════════════════════════════════════════════════════════════════════════════════════════════

// loop 20 ครั้ง
FOR i FROM 1 TO 20
    // ให้ degree = i * 0.1 จะได้ค่ามุม
    SET degree = i * 0.1
    
    // หาค่ารัศมี
    SET radian = pi * degree / 180.0
    
    // คำนวณค่าในตาราง
    SET sinValue = SIN(radian)
    SET cosValue = COS(radian)
    SET tanValue = TAN(radian)
    SET cotValue = 1 / tanValue
    SET secValue = 1 / cosValue
    SET cosecValue = 1 / sinValue
    
    // output
    PRINT:
        format: "🌐 |  %6.1f°  |  %8.6f  |  %8.6f  |  %8.6f  |  %8.6f  |  %8.6f  |  %8.6f  |", 
                degree, sinValue, cosValue, tanValue, cotValue, secValue, cosecValue 
END FOR

PRINT:
    ══════════════════════════════════════════════════════════════════════════════════════════════