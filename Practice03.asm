.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "Enter Hexa Number : $"
msg02 DB "Decimal Number : $"
msg03 DB "Wrong Input Follow '0-9' and 'A-F' $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, msg01
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV BL, AL 
    
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    CMP BL, 39h
    JG PRINT01
    JLE PRINT02
    
    PRINT01:
    CMP BL, 46h
    JG WRONG
     
    MOV AH, 9
    LEA DX, msg02
    INT 21H
    
    MOV AH, 2
    MOV DL, 31h 
    INT 21H
    SUB BL, 11h
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP EXIT
    
    PRINT02:
    CMP BL, 30h
    JL WRONG
    
    MOV AH, 9
    LEA DX, msg02
    INT 21H
    
    MOV AH, 2
    MOV DL, BL 
    INT 21H
    JMP EXIT
    
    WRONG:
    MOV AH, 9
    LEA DX, msg03
    INT 21H 
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 