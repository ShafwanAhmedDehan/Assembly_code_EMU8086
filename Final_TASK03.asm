.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "Enter 1st Number : $"
msg02 DB "Enter 2nd Number : $"
msg03 DB "Shifted to CX : $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, msg01
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 9
    LEA DX, msg02
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    CMP BH, BL
    JG  CHANGE
    JL CHANGE01
    
    CHANGE:
    MOV CH, BH
    MOV AH, 9
    LEA DX, msg03
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    JMP EXIT
    
    CHANGE01:
    MOV CH, BL
    MOV AH, 9
    LEA DX, msg03
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    