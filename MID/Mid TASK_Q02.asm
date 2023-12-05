.MODEL SMALL
.STACK 100H
.DATA

msg01 DB "!$"
msg02 DB 0ah,0dh, "THE SUM OF $"   
msg03 DB " AND $"
msg04 DB " IS $" 
msg05 DB "SUM IS GREATER THEN 10$"
SUM01 DB ?

.CODE
MAIN PROC
    MOV AX,@DATA 
    MOV DS,AX
    
    MOV AH,9
    LEA DX, msg01
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL 
    
    MOV AH,1
    INT 21H
    MOV CH,AL
   
    MOV SUM01,BH
    ADD SUM01,CH
    SUB SUM01,30H
    INT 21H
    
    CMP SUM01,39H
    JL LESSFV
    JG GREATFV
     
    LESSFV:
    
    MOV AH,9
    LEA DX, msg02
    INT 21H
    
    MOV AH,2
    MOV DL, BH
    INT 21H
    
    MOV AH,9
    LEA DX, msg03
    INT 21H
    
    MOV AH,2
    MOV DL, CH
    INT 21H
    
    MOV AH,9
    LEA DX, msg04
    INT 21H
    
    
    MOV AH,2
    MOV DL, SUM01
    INT 21H
    JMP EXIT 
    
    GREATFV:
    MOV AH,9
    LEA DX, msg05
    INT 21H
    JMP EXIT
     
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
