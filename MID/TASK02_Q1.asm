.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
show01 DB "ENTER 1st DIGIT : $"
show02 DB "ENTER 2nd DIGIT : $"   
show03 DB "SUM IS : $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 9
    lea dx, show01
    INT 21H
    
    MOV ah, 1
    INT 21H
    MOV bh, al
    
    MOV ah, 9
    lea dx, nwln
    INT 21H
    
    MOV ah, 9
    lea dx, show02
    INT 21H
    
    MOV ah, 1
    INT 21H
    MOV ch, al
    
    MOV ah, 9
    lea dx, nwln
    INT 21H
    
    MOV ah, 9
    lea dx, show03
    INT 21H
    
    ADD bh, ch
    SUB bh, 30h
    
    MOV ah, 2
    MOV dl, bh
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN