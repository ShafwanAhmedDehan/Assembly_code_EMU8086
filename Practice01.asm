.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX   
    
    MOV CX, 80
    MOV AH, 2h
    MOV DL, '*'
    
    LOOP1:
    INT 21H
    
    LOOP LOOP1
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN