.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 1
    int 21h
    MOV bh, al
    
    MOV ah, 9
    lea dx, nwln
    int 21H
    
    MOV ah, 2
    MOV dl, bh
    int 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    