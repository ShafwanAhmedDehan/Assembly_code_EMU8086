.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "0x$"


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    INT 21H 
    
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV CH, AL 
    INT 21H
    MOV BL, 30H
    
    MULTI:
    ADD BL, BH
    SUB BL, 30H
    
    SUB CH, 31H
    ADD CH, 30H
    CMP CH, 30H
    JE  PRINT
    JG MULTI
         
    PRINT:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 9
    LEA DX, msg01
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN    