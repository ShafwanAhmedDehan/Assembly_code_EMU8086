.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
show01 DB "ENTER NUMBER : $"   
show02 DB "POSITIVE$"
show03 DB "NEGATIVE$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 9
    lea dx, show01
    INT 21H
    
    MOV ah, 1
    INT 21H
    SUB al, 30h
    MOV bl, al
    
    
    MOV ah, 1
    INT 21H 
    
    MOV ah, 9
    lea dx, nwln            
    INT 21H 
    
    CMP bl, 0
    JL ELSE
    JGE IF
    
    
    IF:
    MOV ah, 9
    lea dx, show02
    INT 21H
    JMP exit
    
    ELSE:
    MOV ah, 9
    lea dx, show03
    INT 21H
    
    exit:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN