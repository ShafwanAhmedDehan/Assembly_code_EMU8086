.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
msg01 DB "Hello World$" 
msg02 DB "Bye World$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV cx,5
    
    hello:
    MOV ah, 9
    lea dx, msg01
    INT 21H
    
    MOV ah, 9
    lea dx, nwln
    INT 21H
    
    DEC cx
    CMP cx,0
    JNE hello
    
    MOV cx, 5
    
    bye:
    MOV ah, 9
    lea dx, msg02
    INT 21H
    
    MOV ah, 9
    lea dx, nwln
    INT 21H 
     
    DEC cx
    CMP cx,0
    JNE bye
    
    MOV ah, 4CH
    INT 21H
    MAIN ENDP
END MAIN