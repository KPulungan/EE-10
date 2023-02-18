;This is the GCD algorithm for the Caltech10 Microprocessor
;It finds greatest common divisor between two numbers
;Using the Euler's Algorithm, subtraction version, which goes as follows:
;   Begin with two numbers: a, b
;   REPEAT
;       WHILE (a >= b)
;           a = a - b
;       SWAP a with b
;   UNTIL (b == 0)
;   the GCD will be the final value of a
;a and b are 8-bit values. k is destroyed after the end of the program, 
; as it is only an intermediate value


;Revision History
;   2023-02-11   Kemal Pulungan     uploaded code for GCD

;variables to be used
var1    DB    ?			;first number to find GCD with
var2    DB    ?			;second number to find GCD with

start:
LDD	  var1		;loads var1, first number to find GCD with
CMPI  0			;returns 0 flag
JZ    Swap		;if var1 is 0, immediately jumps to swap var1 and var2
NOP				;proceeds to Loop if var1 != 0


Loop:
LDD   var1      ;loads var1 to accumulator
SUB   var2      ;value in var1 - value in var2
JL    swap		;jumps to swap
NOP             ;continues if no jump
STD   var1		;sets var1 = var1 - var2
JMP	  Loop		;goes back to beginning of while loop if var1 >= var2
NOP

Swap:
;below is the code to swap var1 with var2
LDD   var1		;get var1
TAX			;and put it in X temporarily
LDD   var2		;now get var2
STD   var1		;and store it in var1
TXA			;get original var1 back
STD   var2		;and store it in var2

;below checks if var2 == 0 so the loop can be broken
LDD   var2		;loads var2 to accumulator to check if it's 0 yet
CMPI  0         ;checks if var2 == 0
JNZ   Loop      ;jumps back to beginning of loop if var2 != 0
;JZ   Finish
NOP             ;proceeds if var2 == 0


Finish:
LDD var1		;retrieves value of var1, the GCD, once computations are done
RTS				;returns value in accumulator (var1) that is the GCD