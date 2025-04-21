// Thanapong Yamkamol
// 67130010168

START
    SET equation = 0       // variable เก็บค่าสมการที่เป็นไปได้
    SET evenEquation = 0   // variable เก็บค่าสมการที่เป็นเลขคู่

    PRINT:
        "==================================="
        "🔢       Possible Equations     🔢"
        "===================================\n"

    FOR x FROM 1 TO 100 DO // loop x 1-100
        FOR y FROM 10 TO 150 DO // loop y 10-150
            FOR z FROM 0 TO 50 DO // loop z 0-50
                IF (5*x - 10*y + 2*z == 40) THEN // หาสมการที่ถูกต้อง
                    INCREMENT equation // ถ้าสมการเป็นจริง +1

                    IF (x % 2 == 0 AND y % 2 == 0 AND z % 2 == 0) THEN // หาสมการเลขคู่
                        INCREMENT evenEquation  // ถ้าสมการเป็นจริง +1
                    ENDIF
                    
                    //  print ตัวเลข x y z ที่ทำให้สมการเป็นจริงทั้งหมด
                    PRINT "✅ x: x | y: y | z: z 🎯"
                ENDIF
            ENDFOR
        ENDFOR
    ENDFOR

    // print output
    PRINT:
        "\n ==================================="
        "✅valid equation : \(equation)✅"
        "✅even equation : \(evenEquation)✅"
        "==================================="
END
