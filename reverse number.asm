.model small
.stack 100h
.data
num db 'Enter The Number:$';,10,13
rev_num db ' is the Reversed Number$' 


.code
main proc
    mov ax,@data
    mov ds,ax 
     
   
    
    mov ah,9
    lea dx,num
    int 21h 
     
    ;take input a   
    mov cx,0  
    
input: 
    mov ah,1
    int 21h 
    mov bl,al 
    
    cmp bl ,0dh
    je new_line 
    push bx
    inc cx
    jmp input
    
new_line:  
    mov ah,2     
   
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
         
           
           
   
    
rev:
    pop dx 
    int 21h
    loop rev 
    
    ;xor dx,dx 
   mov ah,9
   lea dx,rev_num
   int 21h   
   
exit:
    mov ah,4ch
    int 21h
    main endp
end main