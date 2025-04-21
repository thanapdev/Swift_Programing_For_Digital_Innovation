// Thanapong Yamkamol  
// 67130010168  

START  

// แสดงข้อความแนะนำโปรแกรม  
PRINT:  
"💰 Input the money to deposit for your happy next 5 years 💰: "  

// รับ input ค่าฝากรายเดือนจาก user  
READ monthlyDeposit  

// ตรวจสอบว่า input เป็นตัวเลขที่ถูกต้อง และต้องมากกว่า 0  
IF monthlyDeposit IS NOT A VALID NUMBER OR monthlyDeposit <= 0 THEN  
    PRINT "❌ Invalid input. Please enter a valid number."  
    EXIT  
END IF  

// กำหนดค่า variable
SET interestRate TO 5.25 / 100  // อัตราดอกเบี้ยต่อปี (5.25%)  
SET totalYears TO 5  // จำนวนปีที่ฝาก (5 ปี)  
SET monthsPerYear TO 12  // เดือนใน 1 ปี

// กำหนดค่า variable ที่เอาไปใช้คำนวณ 
SET totalBalance TO 0  // ยอดเงินรวม  
SET totalInterest TO 0  // ดอกเบี้ยที่ได้รับรวม  
SET year TO 1  // ตัวแปรนับจำนวนปี  

// เริ่มคำนวณดอกเบี้ยและยอดเงินแต่ละปี  
WHILE year <= totalYears DO  
    SET yearlyInterest TO 0  // ดอกเบี้ยที่ได้รับในปีนั้น  
    SET month TO 0  // ตั้งค่าตัวแปรนับจำนวนเดือน  

    // คำนวณแต่ละเดือน  
    WHILE month < monthsPerYear DO  
        // คำนวณดอกเบี้ยของเดือนนั้น  
        SET interest TO (totalBalance + monthlyDeposit) * (interestRate / monthsPerYear)  

        // เพิ่มดอกเบี้ยสะสมของปี  
        yearlyInterest = yearlyInterest + interest  

        // อัปเดตยอดเงินรวม  
        totalBalance = totalBalance + monthlyDeposit + interest  

        // เพิ่มค่าตัวแปรนับเดือน  
        month = month + 1  
    END WHILE  

    // เพิ่มดอกเบี้ยสะสมเข้ากับยอดรวม  
    totalInterest = totalInterest + yearlyInterest  

    // output ต่อปี
    PRINT: 
    "📆 Year ", year, ":"  
    "   💵 Total Balance: ", FORMAT(totalBalance) "THB"
    "   💰 Interest Earned This Year: ", FORMAT(yearlyInterest) "THB"
    "   🔹 Total Interest So Far: ", FORMAT(totalInterest)  "THB \n"  

    // เพิ่มค่าตัวแปรนับปี  
    year = year + 1  
END WHILE  

// output 5 ปี  
PRINT "🎉 After ", totalYears, " years of saving, you've accumulated 💰 ", FORMAT(totalBalance), "THB! 🎉"  
PRINT "✨ Total Interest Earned: ", FORMAT(totalInterest), "THB! ✨"  

END  
