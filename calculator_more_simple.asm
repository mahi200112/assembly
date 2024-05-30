include emu8086.inc
.model small
.stack 100h
.data
msg1 db 10,13, "enter first number: $"
msg2 db 10,13, "enter 2nd number: $"
msg3 db 10,13, "Simple calculator", 10,13, "1--Addition",10,13,"2--Subtraction", 10,13, "3--Multiplication", 10,13,"4--Division",10,13,'$'
msg4 db 10,13,'$'
a db 0
b db 0
choice db ?
rem db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset msg1
    mov ah,9
    int 21h
     
    mov ah,1
    int 21h
    
    sub al,48
    mov a,al 
  
    mov dx,offset msg2
    mov ah,9
    int 21h  
    mov ah,1
    int 21h
    
    sub al,48
    mov b,al
    

    mov dx,offset msg3
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov choice,al
    
     mov dx,offset msg4
    mov ah,9
    int 21h
  
    cmp choice,1
    je addition
    cmp choice,2
    je subtraction
    cmp choice,3
    je multiplication
    cmp choice,4
    je division
    jmp exit
  
addition:
    mov al,a
    add al,b
    
    mov ah,0
    mov bl,10
    div bl ; al = quotient, ah = remainder
    mov rem,ah
    
    print "Addition is: "  
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h

    jmp exit
  
subtraction:
    mov al,a
    sub al,b
  
    print "Subtraction is: "
    mov ah,0
    mov bl,10
    div bl
    mov rem,al
      
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h

    jmp exit
 
multiplication:
    mov al,a
    mov bl,b
    mul b ; AL = lower byte of the result, AH = upper byte of the result
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    print "Multiplication is: "
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h

    jmp exit

division:
    mov al,a
    mov ah,0
    mov bl,b
    div bl ; AL = quotient, AH = remainder
    
    print "Division is: "
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,ah
    add dl,48
    mov ah,2
    int 21h

    jmp exit
  
exit:
    mov ah,4ch
    int 21h
 
main endp
end main
