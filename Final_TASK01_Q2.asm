.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
show01 DB "The Letter is : $"
show02 DB "This is not capital letter$"   


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV ah, 1 
    INT 21H
    MOV bl, al
    
    MOV ah, 9
    LEA dx, nwln
    INT 21H 
    
    CMP bl, 41h
    JL SMALL_LTR
    CMP bl, 5Ah
    JG SMALL_LTR
    JMP CAPITAL
    
    SMALL_LTR:
    MOV ah, 9
    LEA dx, show02
    INT 21H
    JMP EXIT
    
    CAPITAL:
    MOV ah, 9
    LEA dx, show01
    INT 21H
    
    MOV ah, 2
    MOV dl, bl
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN  