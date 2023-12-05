.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "Enter 1st Number : $" 
msg02 DB "Enter 2nd Number : $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, msg01
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BH, AL 
    
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 9
    LEA DX, msg02
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV CH, AL 
    
    CMP BH, CH
    JG PRINT02
    JL PRINT01
    
    PRINT01:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    JMP EXIT
    
    PRINT02:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 