.model small
.stack 100h
.data
    MSG1 DB 10,13,'ENTER THE STRING:$'
    MSG2 DB 10,13,'STRING IS PALINDROME $'
    MSG3 DB 10,13,'STRING IS NOT PALINDROME $'
    STR1 DB 50 DUP(0) 

.code

MAIN PROC
    MOV AX, DATA    
    MOV DS, AX
    LEA DX, MSG1
    MOV AH,09H
    INT 21H
 
    LEA SI,STR1
    LEA DI,STR1
 
    
    ;MOV AH,01H
 
NEXT:  
    MOV AH,01H
    INT 21H
    CMP AL,0DH
    JE TERMINATE
    MOV [DI],AL
    INC DI 
    inc cx
    JMP NEXT
TERMINATE:
    MOV AL,"$"
    MOV [DI],AL 
   
    
 
DO:
    DEC DI
    MOV AL,[SI]
    CMP [DI],AL
    JNE NOTPALINDROME
 
    INC SI
    CMP SI,DI
    JL DO
 
PALINDROME:
    MOV AH,09H
    LEA DX,MSG2
    INT 21H
    JMP XX
 
NOTPALINDROME: 
    MOV AH,09H
    LEA DX,MSG3
    INT 21H 
 
XX:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN