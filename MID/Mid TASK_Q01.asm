.MODEL SMALL
.STACK 100H
.DATA

msg01 DB "Shafwan Ahmed Dehan$" 
msg02 DB 0ah, 0dh, "American International University-Bangladesh$"
msg03 DB 0ah, 0dh, "Dhaka$"
msg04 DB 0ah, 0dh, "Bangladesh$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV ah, 9
    lea dx, msg01
    INT 21H
    
    MOV ah, 9
    lea dx, msg02
    INT 21H
    
    MOV ah, 9
    lea dx, msg03
    INT 21H
    
    MOV ah, 9
    lea dx, msg04
    INT 21H
    
    MOV ah, 4CH
    INT 21H
    MAIN ENDP
END MAIN