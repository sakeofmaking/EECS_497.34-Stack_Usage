; Assembly file for initializing RAM

; Assignment. Here is where you'll put your RAM initialization code.
; 1. Use the .section command to specify that this code is to be executed
;    before the data and bss initialization.
; 2. Fill the RAM, from 0x0200 to 0x21FF, with 0xAA.


; 1. .section command to specify this code be executed before data and bss
; pg 131 of avr-libc user manuel
.section .init1,"ax",@progbits

;2. fill RAM from 0x2000 to 0x21FF with 0xAA
LDI R27, 0x21; upper RAM address high byte
LDI R26, 0xFF; upper RAM address low byte
LDI R25, 0x02; lower RAM address high byte
LDI R24, 0x00; lower RAM address low byte
LDI R16, 0xAA; value to be copied

loop:
ST x, r16; store 0xAA in RAM location
SBIW R26, 1; decrement the RAM address by 1
CP R26, R24; compare low bytes of RAM starting and end address
CPC R27, R25; compare high bytes of RAM starting and end address through carry
BRNE loop; loop if not equal
