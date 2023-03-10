; PROGRAM TO FIND SUM OF TWO DIGIT NUMBERS
ASSUME DS:DATA,CS:CODE
DATA SEGMENT
MSG1 DB 10,13,"ENTER 1ST TWO DIGIT NUMBER:$"
MSG2 DB 10,13,"ENTER 2ND TWO DIGIT NUMBER:$"
MSG3 DB 10,13,"SUM IS $"
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
;DISPLAY 1ST MESSAGE

MOV AH,09
LEA DX,MSG1
INT 21H

; INPUT 1ST NUMBER

MOV AH,01H 
INT 21H 
MOV BH,AL
MOV AH,01H 
INT 21H 
MOV BL,AL

;DISPLAY 12NDST MESSAGE

MOV AH,09
LEA DX,MSG2
INT 21H

; INPUT 2ND NUMBER

MOV AH,01H 
INT 21H 
MOV CH,AL
MOV AH,01H 
INT 21H 
MOV CL,AL
;ADD TWO NUMBERS
MOV AL,BL
MOV AH,00
ADD AL,CL
AAA ;ASCII ADJUST AFTER ADDITION
ADD AX,3030H

MOV BL,AL ; BL HAS LOWER BIT RIGHT NOW

MOV AL,AH ;MOVE REMINDER OF 1ST ADDITION FROM AH TO AL
MOV AH,00 ;FOR AAA
ADD AL,BH ;ADD REMINDER OF 1ST ADDITION TO 2ND DIGIT
ADD AL,CH 
AAA
ADD AX,3030H ;HEXA TO ASCII
MOV BH,AL  ;STORING HIGHER DIGIT IN BH
MOV CL,AH ; STORE CARRY IN CL FROM AH

;DISPLAY 3RD MESSAGE
MOV AH,09H
LEA DX,MSG3
INT 21H

;DISPLAY SUM
MOV AH,02H
MOV DL,CL
INT 21h;DISPLAYED LEFT MOST BIT


;DISPLAY SUM
MOV AH,02H
MOV DL,BH
INT 21h;DISPLAYED CENTRAL BIT


;DISPLAY SUM
MOV AH,02H
MOV DL,BL
INT 21h;DISPLAYED RIGHT MOST BIT

;TERMINATING THE PROGRAM

MOV AH,4CH
INT 21H
CODE ENDS
END START
