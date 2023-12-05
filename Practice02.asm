.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 1
    
    REPEAT:
    INT 21H
    CMP AL, 30h
    JNE REPEAT 
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    