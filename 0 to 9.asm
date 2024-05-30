.model small
.stack 100h
.data    
     msg1 db '0 TO 9: $'  
     ;msg2 db 'Letter in small: $'
.code
main proc 
    mov ax, @data
    mov ds, ax 
    
    mov ah,9
    lea dx,msg1
    int 21h  
       
       
   mov ah,2 
   mov dl,0ah
   int 21h  
   mov dl,0dh 
   int 21h
    
   
    
    
    mov cx, 10
    mov ah, 2
    mov dl, 48



    L1:   
        int 21h 
        inc dl 
        mov bl,dl 
        mov ah, 2   
        mov dl,' '
        int 21h 
        
        
        mov dl,bl
        loop L1  
        
        

        

   mov ah,4ch
   int 21h
   main endp
end main