.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
show01 DB "ENTER NUMBER : $"   
show02 DB "LESS THEN 5$"
show03 DB "GREATER THEN 5$"  
show04 DB "EQUAL TO 5$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 9
    lea dx, show01
    INT 21H
    
    MOV ah, 1
    INT 21H
    MOV bl, al
    
    MOV ah, 9
    lea dx, nwln
    INT 21H  
    
    CMP bl, 35h
    JL LESSfv
    JG GREAT
    JE EQ
    
    LESSfv:
    MOV ah, 9
    lea dx, show02
    INT 21H
    JMP END
    
    GREAT:
    MOV ah, 9
    lea dx, show03
    INT 21H
    JMP END
    
    EQ:
    MOV ah, 9
    lea dx, show04
    INT 21H
    JMP END
    
    END:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN