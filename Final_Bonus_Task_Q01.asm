.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$" 
msg01 DB "Wrong Input Enter Number!!$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    INT 21H
    MOV BL, 30H
    
    CMP BH, 30H
    JL EXIT
    JGE CORRECT
    
    CORRECT:
    CMP BH, 39H
    JG EXIT
    JLE CORRECT01
    
    CORRECT01:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV CH, AL
    INT 21H
    
    CMP CH, 30H
    JL EXIT
    JGE CORRECT02
    
    CORRECT02:
    CMP CH, 39H
    JG EXIT
    JLE CORRECT03 
    
    CORRECT03:
    CMP BH, 35H
    JGE SUM
    JL MULTI
    
    
    
    MULTI:
    ADD BL, BH
    SUB BL, 30H
    
    SUB CH, 31H
    ADD CH, 30H
    CMP CH, 30H
    JE  PRINT
    JG MULTI
    
    PRINT:
    CMP BL, 3Ah
    JL PRINTSEC01
    JGE MODIFY01
    
    MODIFY01:
    SUB BL, 3Ah
    ADD BL, 30h
    CMP BL, 3Ah
    JL PRINTSEC02
    JGE MODIFY02
    
    MODIFY02:
    SUB BL, 3Ah
    ADD BL, 30h
    CMP BL, 3Ah
    JL PRINTSEC03
    JGE MODIFY03
    
    MODIFY03:
    SUB BL, 3Ah
    ADD BL, 30h
    CMP BL, 3Ah
    JL PRINTSEC04
    
    PRINTSEC04:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, 33H
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP EXIT01
    
    PRINTSEC03:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, 32H
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP EXIT01
    
    PRINTSEC02:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, 31H
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP EXIT01
     
    
    PRINTSEC01: 
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP EXIT01
    
    
    
    SUM:
    CMP CH, 35H
    JL MULTI
    ADD BH, CH
    SUB BH, 30H
    SUB BH, 3Ah
    ADD BH, 30H
    
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, 31H
    INT 21H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    JMP EXIT01
    
    EXIT:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 9
    LEA DX, msg01
    INT 21H
    
    EXIT01:   
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    