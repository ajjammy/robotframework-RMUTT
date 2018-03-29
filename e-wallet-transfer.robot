*** Setting ***
Library           Selenium2Library
Test Teardown     Close Browser

*** Variables ***
${URL}                      http://13.250.8.100/web/tranfer.html
${BROWSER}                  Chrome
${label-ชื่อนามสกุลผู้โอน}       label-account-name
${dropdown-บัญชีผู้โอน}         dropdown-account-id
${label-ยอดคงเหลือผู้โอน}      lable-from-balance
${textbox-เลขบัญชีผู้รับ}        textbox-fromBalance
${button-ยืนยันการโอน}        button-tranfer
${label-reference-opt}      lable-reference-otp
${textbox-otp}              textbox-otp
${button-ยืนยัน OTP}          button-otp

*** Test Cases ***
โอนเงินไปบัญชีผู้อื่นภายใน e-wallet
   เปิดหน้าโอนเงิน
   แสดงรายการบัญชีของผู้โอน
   เลือกบัญชีผู้โอน
   แสดงยอดคงเหลือของบัญชี
   กรอกเลขบัญชีผู้รับ
   กรอกจำนวนเงินที่ต้องการโอน
   กดยืนยันการโอน
   ระบุหมายเลข OTP
   ยืนยัน OTP
   แสดงหลักฐานการโอนเงินสำเร็จ


*** Keywords ***
เปิดหน้าโอนเงิน
   Open Browser    ${URL}    ${BROWSER}

แสดงรายการบัญชีของผู้โอน
   Element Text Should Be    ${ชื่อนามสกุลผู้โอน}    ไกรมน  มณีศิลป์
   Page Should Contain       1101041
   Page Should Contain       1101042

เลือกบัญชีผู้โอน
   Select From List By Value    ${dropdown-บัญชีผู้โอน}       1101041

แสดงยอดคงเหลือของบัญชี
   Element Text Should Be       ${label-ยอดคงเหลือผู้โอน}    ไกรมน  มณีศิลป์

กรอกเลขบัญชีผู้รับ
   Input Text       ${textbox-เลขบัญชีผู้รับ}      1021110

กรอกจำนวนเงินที่ต้องการโอน
   Input Text       ${textbox-จำนวนเงินโอน}    1,000.00

กดยืนยันการโอน
   Click Element    ${button-ยืนยันการโอน}

ระบุหมายเลข OTP
   Element Text Should Be       ${label-reference}    0812
   Input Text                   ${textbox-otp}        204100

ยืนยัน OTP
   Click Element    ${button-ยืนยัน OTP}

แสดงหลักฐานการโอนเงินสำเร็จ
   Page Should Contain       28/03/2561
   Page Should Contain       16:16
   Page Should Contain       1101041
   Page Should Contain       1021110
   Page Should Contain       1,000.00
   Page Should Contain       16523082616100001