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
   แสดงรายการบัญชีของผู้โอน         ไกรมน  มณีศิลป์    1101041    1101042
   เลือกบัญชีผู้โอน                  1101041
   แสดงยอดคงเหลือของบัญชี          44,000.00
   กรอกเลขบัญชีผู้รับ                1021110
   กรอกจำนวนเงินที่ต้องการโอน       1,000.00
   กดยืนยันการโอน
   แสดงเลข reference OTP        0812
   ระบุหมายเลข OTP               204100
   ยืนยัน OTP
   แสดงหลักฐานการโอนเงินสำเร็จ     28/03/2561    16:16    1101041    1021110    1,000.00    16523082616100001


*** Keywords ***
เปิดหน้าโอนเงิน
   Open Browser    ${URL}    ${BROWSER}

แสดงรายการบัญชีของผู้โอน
   [Arguments]     ${ชื่อนามสกุลผู้โอน}    ${เลขบัญชีที่ 1}    ${เลขบัญชีที่ 1}
   Element Text Should Be    ${label-ชื่อนามสกุลผู้โอน}    ${ชื่อนามสกุลผู้โอน}
   Page Should Contain       ${เลขบัญชีที่ 1}
   Page Should Contain       ${เลขบัญชีที่ 2}

เลือกบัญชีผู้โอน
   [Arguments]     ${บัญชีผู้โอน}
   Select From List By Value    ${dropdown-บัญชีผู้โอน}       ${บัญชีผู้โอน}

แสดงยอดคงเหลือของบัญชี
   [Arguments]     ${ยอดคงเหลือผู้โอน}
   Element Text Should Be       ${label-ยอดคงเหลือผู้โอน}    ${ยอดคงเหลือผู้โอน}

กรอกเลขบัญชีผู้รับ
   [Arguments]     ${เลขบัญชีผู้รับ}
   Input Text      ${textbox-เลขบัญชีผู้รับ}      ${เลขบัญชีผู้รับ}

กรอกจำนวนเงินที่ต้องการโอน
   [Arguments]     ${จำนวนเงินโอน}
   Input Text      ${textbox-จำนวนเงินโอน}    ${จำนวนเงินโอน}

กดยืนยันการโอน
   Click Element   ${button-ยืนยันการโอน}

แสดงเลข reference OTP
   [Arguments]     ${reference}
   Element Text Should Be       ${label-reference}

ระบุหมายเลข OTP
   [Arguments]     ${otp}
   Input Text      ${textbox-otp}        ${otp}

ยืนยัน OTP
   Click Element    ${button-ยืนยัน OTP}

แสดงหลักฐานการโอนเงินสำเร็จ
   [Arguments]     ${transfer-date}   ${transfer-time}   ${เลขบัญชีผู้โอน}   ${เลขบัญชีผู้รับ}   ${จำนวนเงินโอน}   ${หมายเลขอ้างอิงการโอน}
   Page Should Contain       ${transfer-date}
   Page Should Contain       ${transfer-time}
   Page Should Contain       ${เลขบัญชีผู้โอน}
   Page Should Contain       ${เลขบัญชีผู้รับ}
   Page Should Contain       ${จำนวนเงินโอน}
   Page Should Contain       ${หมายเลขอ้างอิงการโอน}