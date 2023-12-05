.MODEL SMALL
.STACK 100H
.DATA

msg02 DB 0ah,0dh, "NOT DIGIT $" 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 1
    INT 21H
    MOV bl, al
    
    CMP bl, 30h
    JL NOT_D
    CMP bl, 39h
    JG NOT_D
    JMP EXIT
    
    NOT_D:
    MOV ah,9
    lea dx,msg02
    INT 21H
    MOV ah,2
    MOV DL, bl
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN