.MODEL SMALL
.STACK 100H
.DATA

VAL DB "HELLO!$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 9
    lea dx, VAL
    int 21H 
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN