.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "Enter Character : $"
msg02 DB "Thank You$" 
msg03 DB "Wrong Input Enter Capital Letter!!$" 


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
    INT 21H
    
    CMP BH, 41H
    JL EXIT
    JGE CORRECT
    
    CORRECT:
    CMP BH, 5Ah
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
    
    CMP CH, 41H
    JL EXIT
    JGE CORRECT02
    
    CORRECT02:
    CMP CH, 5Ah
    JG EXIT
    JLE CORRECT03
    
    CORRECT03:
    CMP BH, CH
    JGE CHANGE
    JLE NOCHANGE
    
    CHANGE: 
    XCHG BH, CH
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    JMP EXIT01
    
    NOCHANGE:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    JMP EXIT01
    
    EXIT:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 9
    LEA DX, msg03
    INT 21H
    
    EXIT01:
    MOV AH, 9
    LEA DX, nwln
    INT 21H
    
    MOV AH, 9
    LEA DX, msg02
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN