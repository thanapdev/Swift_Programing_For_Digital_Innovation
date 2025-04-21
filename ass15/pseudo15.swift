// Thanapong Yamkamol
// 67130010168

START

// ประกาศฟังก์ชั่น
FUNCTION readInt(prompt: String) -> Int:
    DISPLAY prompt
    READ user input as a string
    TRY to convert input to an integer
        IF conversion is successful:
            RETURN the integer
        ELSE:
            RETURN 0  // ถ้า input ไม่ถูกต้องให้ return เป็น 0

END FUNCTION

// Function หารโดยใช้การลบ
FUNCTION divideBySubtract(base: Int, divisor: Int) -> [Int]:
    SET result = 0
    SET remainder = base

    // 0 หารไม่ได้
    IF divisor == 0 THEN
        DISPLAY "Cannot divide by zero!"
        RETURN [0, 0]
    END IF

    IF base == 0 THEN
        RETURN [0, 0]
    END IF

    IF base < divisor THEN
        RETURN [0, base] 
    END IF

    WHILE remainder >= divisor:
        remainder = remainder - divisor
        result = result + 1
    END WHILE

    RETURN [result, remainder]

END FUNCTION

// user input base number
SET baseNum = CALL readInt("Enter base number:")

// user input divisor number
SET divisorNum = CALL readInt("Enter divisor number:")

// เรียกใช้ฟังก์ชัน divideBySubtract
SET resultArray = CALL divideBySubtract(baseNum, divisorNum)

// output
IF divisorNum != 0 THEN
    DISPLAY baseNum + " divide " + divisorNum + " = " + resultArray[0] + " remainder: " + resultArray[1]
END IF

END 
