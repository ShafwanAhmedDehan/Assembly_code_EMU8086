.MODEL SMALL
.STACK 100H
.DATA

nwln DB 0ah, 0dh, "$"
show01 DB "This is Vowel$"
show02 DB "This is not vowel$"   


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
    
    CMP bl, 61h
    JE VOWEL
    CMP bl, 65h 
    JE VOWEL 
    CMP bl, 69h
    JE VOWEL
    CMP bl, 6Fh
    JE VOWEL
    CMP bl, 75h
    JE VOWEL 
    CMP bl, 41h
    JE VOWEL
    CMP bl, 45h 
    JE VOWEL 
    CMP bl, 49h
    JE VOWEL
    CMP bl, 4Fh
    JE VOWEL
    CMP bl, 55h
    JE VOWEL
    JMP EXIT
    
    VOWEL:
    MOV ah,9
    LEA dx,show01
    INT 21H
    JMP END
    
    EXIT:
    MOV ah, 9
    LEA dx, show02
    INT 21H
    
    END:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN  