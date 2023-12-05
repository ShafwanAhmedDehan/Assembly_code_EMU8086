.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "Enter 1st Number : $"

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
    
    REPEAT:
    INT 21H
    
    CMP AL, ' '
    JNE REPEAT
     
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN  